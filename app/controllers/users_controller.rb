class UsersController < ApplicationController
  skip_before_action :check_is_signed_in
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json:{status: "create!!!"}
    else
      render json:{error_messages: user.errors.full_messages}
    end
  end

  def me
  end

  private

  def user_params
    params.permit(:name, :password, :password_confirmation)
  end
end
