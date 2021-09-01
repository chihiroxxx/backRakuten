module Api
  module V1
class HomeController < ApplicationController
  def index
    user = User.find_by(id: session[:user_id])
    render json: {user_id: user.id}
  end
end
end
end
