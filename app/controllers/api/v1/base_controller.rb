class Api::V1::BaseController < ApplicationController
  # respond_to :json

  attr_accessor :current_user

  # disable the CSRF token
  protect_from_forgery with: :null_session

  # disable cookies (no set-cookies header in response)
  before_action :destroy_session

  def destroy_session
    request.session_options[:skip] = true
  end

  def authenticate_user!
    token, options = ActionController::HttpAuthentication::Token.token_and_options(request)

    user_name = options.blank?? nil : options[:name]
    user_name = 'admin'
    user = user_name && User.find_by(name: user_name)

    Rails.logger.info("----------token:--#{token.inspect}")
    Rails.logger.info("----------options:--#{options[:name].inspect}")
    Rails.logger.info("----------user_name:--#{user_name.inspect}")
    Rails.logger.info("----------user:--#{user.inspect}")

    if user && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token)
       self.current_user = user
    else
       return unauthenticated!
    end
  end

  def unauthenticated!
    api_error(status: 401)
  end

  def api_error(opts = {})
   render nothing: true, status: opts[:status]
  end
end
