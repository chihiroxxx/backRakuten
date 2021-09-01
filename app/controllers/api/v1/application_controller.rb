module Api
  module V1
class ApplicationController < ActionController::API
  # before_action :current_user

  # before_action :check_xhr_header


  before_action :check_is_signed_in

  def check_is_signed_in
    if !session[:user_id]
      render_401_error("unauthorized")
      return
    end

    @user = User.find(session[:user_id])
  end

  def render_401_error(error = nil)
    render json: { message: "unauthorized" }, status: 401
  end



  private

  # def current_user
  #   return unless session[:user_id]
  #   @current_user = User.find_by(id: session[:user_id])
  # end



  def check_xhr_header
    return if request.xhr?

    render json: { error: 'forbidden' }, status: :forbidden
  end
end
end
end
