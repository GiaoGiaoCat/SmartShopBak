json.array!(@payments) do |payment|
  json.extract! payment, :id, :amount, :order_id, :source_id, :source_type, :payment_method_id, :state, :response_code, :avs_response, :identifier, :cvv_response_code, :cvv_response_message
  json.url admin_payment_url(payment, format: :json)
end
