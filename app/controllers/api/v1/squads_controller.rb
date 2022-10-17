class Api::V1::SquadsController < ApplicationController
  def create
    user = User.find_by_id(params[:user])
    squad = Squad.new(squad_params)
    if squad.save
      user_squad = UserSquad.create!(
        user_id: user.id,
        squad_id: squad.id,
        host_id: user.id,
        status: 1
      )
      render json: SquadSerializer.new(squad), status: 201
    end
  end

  private
    def squad_params
      params.permit(:game, :event_time, :number_players, :competitive)
    end
end