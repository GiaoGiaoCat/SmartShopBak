class LineItem < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # security ..................................................................
  # relationships .............................................................
  belongs_to :order, inverse_of: :line_items
  belongs_to :variant

  has_one :product, through: :variant
  # validations ...............................................................
  before_validation :copy_price

  validates :variant, presence: true
  validates :quantity, numericality: {
    only_integer: true,
    greater_than: -1
    # message: Spree.t('validation.must_be_int')
  }
  validates :price, numericality: true
  # callbacks .................................................................
  # scopes ....................................................................
  # additional config .........................................................
  delegate :name, :description, to: :variant
  # class methods .............................................................
  # public instance methods ...................................................
  def copy_price
    if variant
      self.price = variant.price if price.nil?
      # TODO
      # 因为v1版本没有进价，暂时使用销售价
      # self.cost_price = variant.cost_price if cost_price.nil?
      self.cost_price = variant.price if cost_price.nil?
      self.currency = variant.currency if currency.nil?
    end
  end

  def amount
    price * quantity
  end
  # protected instance methods ................................................
  # private instance methods ..................................................
end
