class Api::V1::RawgSearchController < ApplicationController

  def index
    if search_params[:genres].nil?
      results = RawgSearchFacade.get_name(search_params[:search])
      render json: RawgSearchSerializer.format_games(results)
    else
      results_gen = RawgSearchFacade.get_name_and_genre(search_params[:search],search_params[:genres])
      render json: results_gen
    end
  end

  private

  def search_params
    params.permit(:search, :genres)
  end
end
