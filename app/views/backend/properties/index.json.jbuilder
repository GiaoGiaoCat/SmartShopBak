json.array!(@properties) do |property|
  json.extract! property, :id, :name, :presentation
  json.url admin_property_url(property, format: :json)
end
