class Api::V1::GamesController < ApplicationController
  def show
    game = RawgFacade.get_game(params[:id])
    if !game.nil?
      render json: game, status: 200
    else
      render json: { description: "Error: No game found" }, status: 404
    end
  end
end 
