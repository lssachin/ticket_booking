class BookingsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:cancel, :create, :cancel_all]
  def index
    @bookings = @user.bookings.includes(:show, :movie, :theater).order("bookings.created_at desc")
  end

  def create
    params = JSON(request.body.read)["booking"].symbolize_keys
    @booking = @user.bookings.new(no_of_tickets: params[:no_of_tickets])
    @booking.show = Show.find_by_id(params[:show_id])
    @booking.coupon = Coupon.find_by_code(params[:coupon_code])
    if @booking.save
      render plain: "Booking Confirmed", status: 204
    else
      render plain: "Booking Failed", status: 422
    end
  end

  def new
    @show = Show.find_by_id(params[:show_id])
    @booking = @show.bookings.new
  end

  def cancel_all
    bookings = @user.bookings.where(show_id: params[:show_id], is_cancelled: false)
    bookings.each do |booking|
      booking.cancel!
    end
    render plain: "All Booking Cancelled", status: 204
  end

  def cancel
  	booking = @user.bookings.find_by(id: params[:id])
    if booking.present?
      booking.cancel!
    end
  	render plain: "Booking Cancelled", status: 204
  end
end
