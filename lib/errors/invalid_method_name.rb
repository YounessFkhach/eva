class Errors::InvalidMethodName < StandardError
  def code
    "invalid_auth_method"
  end

  def message
    "the given authentication method is not valid"
  end

  def status
    400
  end
end