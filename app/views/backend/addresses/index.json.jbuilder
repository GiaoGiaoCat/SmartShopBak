json.array!(@addresses) do |address|
  json.extract! address, :id, :name, :zipcode, :phone, :city, :province, :district, :address
  json.url admin_address_url(address, format: :json)
end
