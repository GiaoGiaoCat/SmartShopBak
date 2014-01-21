json.array!(@shipping_categories) do |shipping_category|
  json.extract! shipping_category, :id, :name
  json.url admin_shipping_category_url(shipping_category, format: :json)
end
