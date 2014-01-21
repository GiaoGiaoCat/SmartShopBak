# https://github.com/spree/spree/blob/master/core/app/models/spree/price.rb
# https://github.com/spree/spree/blob/master/core/lib/spree/money.rb
class Price < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # security ..................................................................
  # relationships .............................................................
  belongs_to :variant, inverse_of: :prices
  # validations ...............................................................
  validates :variant, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  # callbacks .................................................................
  before_validation :set_currency
  # scopes ....................................................................
  # additional config .........................................................
  CURRENCIES = [["CNY", "cn"]]
  # class methods .............................................................
  # public instance methods ...................................................
  # alias_attribute :price, :amount

  def price
    amount
  end

  def price=(price)
    self[:amount] = price
  end

  # HACK:
  # 这里的 should_save? 方法应该被重构，因为在 Variant 里面有类似的方法
  def should_save?
    changed? || new_record?
  end
  # protected instance methods ................................................
  # private instance methods ..................................................
  private
    def set_currency
      raise "Price must belong to a variant" if variant.nil?
      self.currency = 'cn' if currency.nil?
    end
end
