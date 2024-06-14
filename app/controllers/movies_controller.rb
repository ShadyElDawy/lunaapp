class MoviesController < ApplicationController
  before_action :set_movies, only: [:index, :search]

  def index
  end

  def search
    render :index
  end

  private

  def set_movies
    cache_key = generate_cache_key('movies', params.slice(:actor))
    @movies ||= Rails.cache.fetch(cache_key) do
      Movie.sort_by_average_stars.by_actor(params[:actor])
    end
  end
end