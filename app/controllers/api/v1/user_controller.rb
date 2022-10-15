class Api::V1::UserController < ApplicationController

  def show
    render json: UserSerializer.new(User.find(params[:id]))
  end

end
