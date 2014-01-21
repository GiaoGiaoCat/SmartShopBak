json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :available_on, :deleted_at, :permalink, :meta_description, :meta_keywords
  json.url admin_product_url(product, format: :json)
end
