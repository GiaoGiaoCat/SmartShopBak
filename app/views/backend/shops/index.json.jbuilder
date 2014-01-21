json.array!(@shops) do |shop|
  json.extract! shop, :id, :title
  json.url admin_shop_url(shop, format: :json)
end
