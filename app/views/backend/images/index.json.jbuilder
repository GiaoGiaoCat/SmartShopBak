json.array!(@images) do |image|
  json.extract! image, :id, :alt
  json.url admin_product_image_path(@product, image, format: :json)
end
