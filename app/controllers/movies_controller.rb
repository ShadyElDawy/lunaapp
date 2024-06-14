class MoviesController < ApplicationController
  before_action :set_movies, only: [:index, :search]

  def index
  end

  def search
    render :index
  end

  private

  def set_movies
    @movies = Movie.by_actor(params[:actor]).with_average_stars
  end
end
