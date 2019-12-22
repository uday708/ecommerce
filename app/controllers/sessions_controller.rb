class SessionsController < ApplicationController
  skip_before_action :validate_authenticity_token

  def create
    user = User.find_or_initialize_by(user_params)
    if user.save
      render json: { token: user.authenticity_token }
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  private

  def user_params
    params.permit(:email, :password_digest)
  end
end
