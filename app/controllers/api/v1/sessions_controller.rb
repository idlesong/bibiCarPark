class Api::V1::SessionsController < Api::V1::BaseController
  def create
    @user = User.find_by(name: create_params[:name])
    if @user && @user.authenticate(create_params[:password])
      self.current_user = @user
    else
      return api_error(status: 401)
    end
  end

  private

  def create_params
    params.require(:user).permit(:name, :contact, :password)
  end

end
