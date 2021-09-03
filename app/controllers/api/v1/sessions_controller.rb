module Api
  module V1
class SessionsController < ApplicationController
  skip_before_action :check_is_signed_in
  # , only: :create
  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # render json:するセッション返すのかな？
      # render json: { message: "sign in success" }??
      render json: {message: "sign in success", user_id: user.id}, status: 200
    else
      render json: { message: "unauthorized" }, status: 401
    end
  end

  def destroy
    session.delete(:user_id)
  end
end
end
end
