class Theater < ApplicationRecord
	has_many :shows
	has_many :movies, through: :shows
end
