class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :validate_authenticity_token

  def validate_authenticity_token
    if params.permit(:token).to_h[:token].present?
      payload = JWT.decode(params[:token], User::SECRET_KEY)[0]
      @user = User.find payload['id']
    else
      render json: { error: "Session Expired" }
    end
  end

  def current_user
    @user
  end

  def default_serializer_options
    {root: false}
  end
end
