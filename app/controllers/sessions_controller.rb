class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid user name/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end

end
