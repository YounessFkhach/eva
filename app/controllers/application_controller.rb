class ApplicationController < ActionController::API
  rescue_from Errors::UserNotFound, with: :rescue
  rescue_from Errors::InvalidPassword, with: :rescue
  rescue_from Errors::InvalidMethodName, with: :rescue

  private
  def rescue(error)
    json = {
      code: error.code,
      message: error.message
    }
    render json: json, status: error.status
  end
end
