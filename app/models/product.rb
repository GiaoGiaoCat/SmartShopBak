class Product < ActiveRecord::Base
  # extends ...................................................................
  acts_as_paranoid
  # includes ..................................................................
  # security ..................................................................
  # relationships .............................................................
  belongs_to :shipping_category, inverse_of: :products

  has_one :master,
    -> { where is_master: true },
    inverse_of: :product,
    class_name: 'Variant',
    dependent: :destroy

  has_many :variants,
    -> { where is_master: false },
    inverse_of: :product

  has_many :variants_including_master,
    inverse_of: :product,
    class_name: 'Variant',
    dependent: :destroy

  has_many :product_option_types, dependent: :destroy, inverse_of: :product
  has_many :option_types, through: :product_option_types
  has_many :product_properties, dependent: :destroy, inverse_of: :product
  has_many :properties, through: :product_properties
  # validations ...............................................................
  validates :name, presence: true
  validates :permalink, presence: true
  validates :shipping_category_id, presence: true
  validates :master_price, numericality: { greater_than_or_equal_to: 0 }, presence: true
  # callbacks .................................................................
  after_create :add_properties_and_option_types_from_prototype
  after_create :build_variants_from_option_values_hash, if: :option_values_hash
  after_save :set_master_variant_defaults
  after_save :save_master

  after_initialize :ensure_master
  # scopes ....................................................................
  scope :available, -> { where("available_on <= ?", Time.now) }
  # additional config .........................................................
  # option_values_hash example:
  # { option_type_id_1: [option_value_ids], option_type_id_2: [option_value_ids] }
  # { 1: [1, 3], 3: [1], 4: [6, 7, 8]}
  attr_accessor :master_sku, :master_price, :option_values_hash

  delegate :sku, :price, :currency, :cost_price, :cost_currency,
           :weight, :height, :width, :depth, :is_master,
           to: :master

  accepts_nested_attributes_for :variants, allow_destroy: true
  accepts_nested_attributes_for :product_properties,
    allow_destroy: true,
    reject_if: lambda { |pp| pp[:name].blank? }
  # class methods .............................................................
  # public instance methods ...................................................
  # HACK:
  # `restore` method of paranoia gem not working for rails 4.1.
  # read: https://github.com/radar/paranoia/pull/95
  # Product.restore(params[:id])
  def restore
    self.update_column(:deleted_at, nil)
  end

  # Adding properties and option types on creation based on a chosen prototype
  attr_reader :prototype_id
  def prototype_id=(value)
    @prototype_id = value.to_i
  end

  def available_on
    self[:available_on].to_s(:date) if self[:available_on]
  end

  # Master variant may be deleted (i.e. when the product is deleted)
  # which would make AR's default finder return nil.
  # This is a stopgap for that little problem.
  # def master
  #   super || variants_including_master.with_deleted.where(is_master: true).first
  # end
  # protected instance methods ................................................
  # private instance methods ..................................................
  private
    # Ensures option_types and product_option_types exist for keys in option_values_hash
    def ensure_option_types_exist_for_values_hash
      return if option_values_hash.nil?
      option_values_hash.keys.map(&:to_i).each do |id|
        self.option_type_ids << id unless option_type_ids.include?(id)
        unless product_option_types.pluck(:option_type_id).include?(id)
          product_option_types.create(option_type_id: id)
        end
      end
    end

    # Builds variants from a hash of option types & values
    def build_variants_from_option_values_hash
      ensure_option_types_exist_for_values_hash
      values = option_values_hash.values
      values = values.inject(values.shift) { |memo, value| memo.product(value).map(&:flatten) }

      values.each do |ids|
        variant = variants.create(option_value_ids: ids, variant_price: master_price)
      end

      save
    end

    def add_properties_and_option_types_from_prototype
      if prototype_id && prototype = Prototype.find_by(id: prototype_id)
        prototype.properties.each do |property|
          product_properties.create(property: property)
        end
        # Don NOT need to save self if option_values_hash.nil?
        self.option_types = prototype.option_types
      end
    end

    # ensures the master variant is flagged as such
    # HACK:
    # 这里的代码需要重构
    def set_master_variant_defaults
      master.sku = master_sku if master_sku
      master.price = master_price if master_price
      master.is_master = true
    end

    # there's a weird quirk with the delegate stuff that does not automatically save the delegate object
    # when saving so we force a save using a hook.
    def save_master
      if master && master.should_save?
        master.save
      end
    end

    def ensure_master
      return unless new_record?
      self.master ||= variants.new
    end
end
