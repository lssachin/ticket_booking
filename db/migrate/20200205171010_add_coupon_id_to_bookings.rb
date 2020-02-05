class AddCouponIdToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :coupon
  end
end
