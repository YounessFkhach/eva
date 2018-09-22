require 'jwt'

class JwtService
  attr_reader :user_id, :exp

  def initialize(user)
    @user_id = user.id
    @exp = expiration_date
  end

  def call
    token = JWT.encode payload, ENV['secret'], 'HS256'

    { token: token, exp: exp }
  end

  private
  def payload
    { user_id: user_id, exp: exp }
  end

  def expiration_date
    Time.now + 1*60*60
  end
end