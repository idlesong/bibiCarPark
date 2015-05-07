json.array!(@payments) do |payment|
  json.extract! payment, :id, :unit_price, :total_time, :discount, :total
  json.url payment_url(payment, format: :json)
end
