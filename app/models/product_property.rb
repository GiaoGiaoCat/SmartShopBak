class ProductProperty < ActiveRecord::Base
  belongs_to :product, touch: true, inverse_of: :product_properties
  belongs_to :property, inverse_of: :product_properties

  validates :property, presence: true
  validates :value, length: { maximum: 255 }

  def name
    property.name if property
  end

  def name=(property_name)
    unless property_name.blank?
      unless property = Property.find_by(name: property_name)
        property = Property.create(name: property_name, presentation: property_name)
      end
      self.property = property
    end
  end
end
