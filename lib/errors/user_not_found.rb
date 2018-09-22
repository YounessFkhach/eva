class Errors::UserNotFound < StandardError
  def code
    "user_not_found"
  end

  def message
    "the requested user does not exist in the database"
  end

  def status
    404
  end
end