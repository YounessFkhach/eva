class AuthenticationsController < ApplicationController

  def call
    @user = UserFinderService.new(params[:method]).call(permited_params)

    @hash = JwtService.new(@user).call
  end

  def permited_params
    {
      email: params.fetch(:email, nil),
      password: params.fetch(:password, nil)
    }
  end
end