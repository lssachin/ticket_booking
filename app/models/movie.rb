class Movie < ApplicationRecord
	has_many :shows
	has_many :theaters, through: :shows
	has_many :bookings, through: :shows
end
