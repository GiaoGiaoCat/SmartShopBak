json.array!(@option_types) do |option_type|
  json.extract! option_type, :id, :name, :presentation, :position
  json.url admin_option_type_url(option_type, format: :json)
end
