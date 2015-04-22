json.array!(@parkings) do |parking|
  json.extract! parking, :id, :enter_time, :exit_time, :park_time, :leave_time
  json.url parking_url(parking, format: :json)
end
