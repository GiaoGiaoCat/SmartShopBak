class Variant < ActiveRecord::Base
  # extends ...................................................................
  acts_as_paranoid
  # includes ..................................................................
  # security ..................................................................
  # relationships .............................................................
  belongs_to :product, touch: true

  has_one :default_price,
    -> { where(currency: 'cn') },
    class_name: 'Price',
    dependent: :destroy

  has_and_belongs_to_many :option_values

  has_many :line_items
  has_many :assets, dependent: :destroy
  has_many :prices, dependent: :destroy, inverse_of: :variant
  # validations ...............................................................
  validates :product, presence: true
  # sku 对于某些商家并非必须的字段
  # validates :sku, presence: true, uniqueness: true
  # v1 版本不需要进价
  # validates :cost_price, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  # callbacks .................................................................
  # v1 版本不需要进价
  before_validation :set_cost_currency
  after_create :set_default_price
  after_create :set_position
  after_save :save_default_price

  after_initialize :ensure_default_price
  # scopes ....................................................................
  default_scope { order("position DESC") }
  # additional config .........................................................
  # variant_price
  attr_accessor :variant_price

  delegate :name, :description, :permalink, :available_on,
           :shipping_category_id, :meta_description, :meta_keywords,
           :shipping_category, to: :product

  delegate :price, :price=, :currency, to: :default_price

  accepts_nested_attributes_for :assets, allow_destroy: true
  # class methods .............................................................
  # public instance methods ...................................................
  # HACK:
  # 这里的 should_save? 方法应该被重构，因为在 Price 里面有类似的方法
  def should_save?
    changed? || new_record? || (default_price && default_price.should_save?)
  end

  def options_text
    values = option_values.joins(:option_type)

    values.collect! do |ov|
      "#{ov.option_type.presentation}: #{ov.presentation}"
    end

    values.to_sentence({ words_connector: ", ", two_words_connector: ", " })
  end

  def sku_and_options_text
    "#{sku} #{options_text}".strip
  end

  # protected instance methods ................................................
  # private instance methods ..................................................
  private
    def set_cost_currency
      self.cost_currency = 'cn' if cost_currency.blank?
    end

    def set_default_price
      default_price.amount = variant_price || product.master_price
    end

    def save_default_price
      if default_price && default_price.should_save?
        default_price.save
      end
    end

    def ensure_default_price
      return unless new_record?
      self.default_price ||= prices.new
    end

    def set_position
      update_column(:position, product.variants.maximum(:position).to_i + 1)
    end
end
