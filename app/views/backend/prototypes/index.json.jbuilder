json.array!(@prototypes) do |prototype|
  json.extract! prototype, :id, :name
  json.url admin_prototype_url(prototype, format: :json)
end
