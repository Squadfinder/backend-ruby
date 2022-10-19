class Api::V1::RawgSearchController < ApplicationController

  def index
    if (search_params[:genres]) == "null"
      results = RawgSearchFacade.get_name(search_params[:search])
      render json: RawgSearchSerializer.format_games(results)
    end
  end

  private

  def search_params
    params.permit(:search, :genres)
  end

end
