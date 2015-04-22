json.array!(@cars) do |car|
  json.extract! car, :id, :plate, :type
  json.url car_url(car, format: :json)
end
