class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :theater
  has_many :bookings
  has_many :users, through: :bookings

  def valid?
    if show_date > Date.today
      return true
    elsif show_date == Date.today
      if show_time.hour > Time.now.hour
        return true
      elsif show_time.hour == Time.now.hour
        if show_time.min >= Time.now.min
          return true
        else
          false
        end
      else
        return false
      end
    else
      return false
    end
  end

  def available_tickets
    theater.seats - bookings.where(is_cancelled: false).collect{|booking| booking.no_of_tickets}.compact.sum
  end

  def time
    "#{show_time.hour} : #{show_time.min}"
  end
end
