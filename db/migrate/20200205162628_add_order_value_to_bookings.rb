class AddOrderValueToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :order_value, :integer
  end
end
