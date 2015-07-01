class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user!, only: [:update]

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.update_attributes(update_params)
    # @user.update(update_params)

    @user = User.find(params[:id])
    Rails.logger.info("---------------------#{@user.inspect}")
  end

  private

  def update_params
    params.require(:user).permit(:note)
  end
end
