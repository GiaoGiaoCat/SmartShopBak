json.array!(@shipping_methods) do |shipping_method|
  json.extract! shipping_method, :id, :name, :deleted_at
  json.url admin_shipping_method_url(shipping_method, format: :json)
end
