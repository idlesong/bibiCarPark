json.session do
  json.(@user, :id, :name)
  json.token @user.authentication_token
end
