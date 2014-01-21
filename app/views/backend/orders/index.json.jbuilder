json.array!(@orders) do |order|
  json.extract! order, :id, :number, :item_total, :total, :state, :completed_at, :email, :special_instructions
  json.url order_url(order, format: :json)
end
