class Api::V1::Users::SquadsController < ApplicationController
  
  def index
    user = User.find_by(params[:id]) 
    squads = UserSquad.where(user_id: user.id)
    render json: squads, status: 201
  end
end