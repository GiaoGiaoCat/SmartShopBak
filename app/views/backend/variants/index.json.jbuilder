json.array!(@variants) do |variant|
  json.extract! variant, :id, :sku, :product_id
  json.url admin_product_variant_url(@product, variant, format: :json)
end
