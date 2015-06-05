json.array!(@nodes) do |node|
  json.extract! node, :id, :hardware_id, :status, :main_hub, :alt_hub, :monitor, :display
  json.url node_url(node, format: :json)
end
