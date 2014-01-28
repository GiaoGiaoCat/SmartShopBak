require 'csv'
class Order < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  include OrderStateTracking
  # security ..................................................................
  # relationships .............................................................
  belongs_to :ship_address, foreign_key: :ship_address_id, class_name: 'Address'

  has_many :line_items, -> { order('created_at ASC') }, dependent: :destroy
  has_many :shipments, dependent: :destroy
  has_many :payments, dependent: :destroy
  # validations ...............................................................
  # callbacks .................................................................
  before_validation :generate_order_number, on: :create
  after_save :update_totals
  # scopes ....................................................................
  scope :search, ->(k) {
    joins(:ship_address)
      .where("addresses.name LIKE ? OR addresses.phone LIKE ?", "%#{k}%", "%#{k}%")
  }
  scope :working, -> { where(state: ['pending', 'paid']) }
  # additional config .........................................................
  alias_attribute :shipping_address, :ship_address
  alias_attribute :name, :number

  accepts_nested_attributes_for :line_items, :allow_destroy => true
  accepts_nested_attributes_for :ship_address
  accepts_nested_attributes_for :payments
  accepts_nested_attributes_for :shipments
  # class methods .............................................................
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |order|
        csv << order.attributes.values_at(*column_names)
      end
    end
  end

  # public instance methods ...................................................

  def persist_address(address_params)
    ship_address ||= build_ship_address
    ship_address.attributes = address_params
    ship_address.save
    update_column(:ship_address_id, ship_address.id)
  end

  def generate_order_number
    record = true
    while record
      random = Array.new(15){rand(9)}.join
      record = self.class.where(number: random).first
    end
    self.number = random if self.number.blank?
    self.number
  end

  def ship_total
    # shipments.sum(:cost)
    0
  end

  def products
    line_items.map(&:product)
  end

  def variants
    line_items.map(&:variant)
  end

  def quantities
    line_items.map(&:quantity).sum
  end

  def update_totals
    # order.payment_total = payments.completed.sum(:amount)
    update_item_total
    # update_shipment_total
    # update_adjustment_total
    persist_totals
  end

  def update_item_total
    self.item_total = line_items.map(&:amount).sum
    update_order_total
  end

  def update_order_total
    self.total = item_total + ship_total
  end

  # https://github.com/spree/spree/blob/17c59ec233f56b8bb965dad627d0ebdf99eeaf58/core/app/models/spree/order_updater.rb
  def persist_totals
    update_columns(item_total: item_total, total: total)
  end

  def finalize!
    #...
  end

  def process_payments!
    # TODO
    # 必须要改进这里
    payment = BaiduWallet::Payment.new(
      order_create_time: self.created_at.strftime("%Y%m%d%H%M%S"),
      order_no:          self.number,
      goods_name:        self.line_items.first.product.name,
      total_amount:      self.line_items.first.quantity)

    payment.url
  end

  # protected instance methods ................................................
  # private instance methods ..................................................
end
