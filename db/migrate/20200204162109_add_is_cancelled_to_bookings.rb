class AddIsCancelledToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :is_cancelled, :boolean, default: false
  end
end
