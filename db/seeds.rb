# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Shop.create(name: "测试商铺")

ShippingMethod.create(name: "EMS")
ShippingMethod.create(name: "圆通")

PaymentMethod.create(name: "Alipay")

ShippingCategory.create(name: "货到付款")
ShippingCategory.create(name: "先付款")

ShippingMethodCategory.create(shipping_method_id: 1, shipping_category_id: 1)
ShippingMethodCategory.create(shipping_method_id: 1, shipping_category_id: 2)
ShippingMethodCategory.create(shipping_method_id: 2, shipping_category_id: 1)

30.times do |i|
  Product.create(
    name: "product_n_#{i}",
    shipping_category_id: 1,
    available_on: '2014-02-23',
    permalink: "product_n_#{i}",
    master_sku: "SK_#{i}",
    master_price: 200
  )
end
# Product.create(name: "裤子", shipping_category_id: 2)

# Address.create(name: '老李', phone: '13244556677', address: '长春一汽')
# Address.create(name: '小王', phone: '13244558888', address: '长白山')

# order_1 = Order.create(ship_address_id: 1)
# order_2 = Order.create(ship_address_id: 2)
# order_1.line_items.create(variant_id: 1, price: 20, quantity: 1, cost_price: 5)
# order_2.line_items.create(variant_id: 2, price: 30, quantity: 2, cost_price: 6)
# order_2.line_items.create(variant_id: 3, price: 14.5, quantity: 1, cost_price: 7)

["Size", "Model", "Shirt Type", "Brand"].each do |p|
  Property.create(name: p, presentation: p)
end
["Shirt", "Bag", "Mugs"].each do |p|
  Prototype.create(name: p)
end

ot1 = OptionType.create(name: 'tshirt-size', presentation: 'Size')
ot2 = OptionType.create(name: 'tshirt-color', presentation: 'Color')

ot1.option_values.create(name: 'Small', presentation: 's')
ot1.option_values.create(name: 'Extra Large', presentation: 'XL')
ot2.option_values.create(name: 'Red', presentation: 'Red')
ot2.option_values.create(name: 'Green', presentation: 'Green')

prototype = Prototype.find(1)
prototype.property_ids = [1, 2, 3]
prototype.option_type_ids = [1]
prototype.save
