class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order("screen_date DESC")
  end
end
