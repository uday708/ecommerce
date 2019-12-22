require 'jwt'

class User < ApplicationRecord
  SECRET_KEY = "anything"
  validates_presence_of :email, :password_digest
  has_one :cart

  def authenticity_token
    JWT.encode({id: id, exp: 5.hours.from_now.to_i}, SECRET_KEY)
  end
end
