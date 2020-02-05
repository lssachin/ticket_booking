class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :show
  belongs_to :coupon, optional: true
  has_one :movie, through: :show
  has_one :theater, through: :show
  validate :validate_tickets_availablity
  before_validation :set_order_value, on: :create

  def set_order_value
    self.order_value = (user.gender == "F" ? no_of_tickets.to_i*show.price*0.95 : no_of_tickets.to_i*show.price)
    if coupon.present?
      self.order_value = self.order_value - coupon.discount
      self.order_value = 0 if self.order_value < 0
    end
  end

  def validate_tickets_availablity
    if show.available_tickets < no_of_tickets
      errors.add(:no_of_tickets, "Only #{show.available_tickets} Tickets are available")
    end
  end

  def cancel!
    self.update_attribute(:is_cancelled,true)
  end
end
