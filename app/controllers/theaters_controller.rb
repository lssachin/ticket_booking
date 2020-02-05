class TheatersController < ApplicationController
  def index
    @movie = Movie.find(params[:movie_id])
    @shows = @movie.shows.includes(:theater, :bookings).order(:show_date,:show_time)
    @user_shows_ids = @user.bookings.where(is_cancelled: false).includes(:show).collect{|booking| booking.show.id} rescue nil
  end
end
