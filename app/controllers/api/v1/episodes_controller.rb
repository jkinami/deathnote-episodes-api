class Api::V1::EpisodesController < ApplicationController

  def index
    if params[:episode_number].present?
      @episodes = Episode.find_by(episode_number: params[:episode_number])
    else
      @episodes = Episode.all
    end

    render json: @episodes
  end
end
