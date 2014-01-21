json.array!(@shipments) do |shipment|
  json.extract! shipment, :id, :tracking, :number, :cost, :shipped_at, :order_id, :address_id, :state
  json.url admin_shipment_url(shipment, format: :json)
end
