class Errors::InvalidPassword < StandardError
  def code
    "invalid_password"
  end

  def message
    "the given password is invalid"
  end

  def status
    400
  end
end