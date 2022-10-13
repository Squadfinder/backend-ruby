class WelcomeController < ApplicationController
  def index
    users = User.all
    render json: {test: users}
  end
end