class UserFinderService
  include Errors
  attr_reader :method

  def initialize(method)
    @method = method

    validate_method!
  end

  def call(**data)
    self.send("get_user_by_#{method.to_s}", data)
  end

  private
  def get_user_by_email(email:, password:)
    user = User.find_by(email: email)
    return raise_user_not_found_error! if user.nil?

    validate_user_password!(user, password)

    user
  end

  def validate_user_password!(user, password)
    raise Errors::InvalidPassword unless user.authenticate(password)
  end

  def raise_user_not_found_error!
    raise Errors::UserNotFound
  end

  def validate_method!
    raise Errors::InvalidMethodName unless supported_methods.include?(method.to_sym)
  end

  def supported_methods
    %i[email]
  end
end