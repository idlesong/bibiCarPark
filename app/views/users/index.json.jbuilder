json.array!(@users) do |user|
  json.extract! user, :id, :name, :contact, :sex, :age, :group, :note
  json.url user_url(user, format: :json)
end
