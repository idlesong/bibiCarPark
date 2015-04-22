json.array!(@lots) do |lot|
  json.extract! lot, :id, :mark, :area, :coordinate
  json.url lot_url(lot, format: :json)
end
