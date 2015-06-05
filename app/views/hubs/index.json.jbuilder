json.array!(@hubs) do |hub|
  json.extract! hub, :id, :status, :hardware_id, :max_nodes
  json.url hub_url(hub, format: :json)
end
