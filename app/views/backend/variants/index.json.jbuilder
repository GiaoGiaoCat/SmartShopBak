json.array!(@variants) do |variant|
  json.extract! variant, :id, :sku, :product_id
  json.url admin_variant_url(variant, format: :json)
end
