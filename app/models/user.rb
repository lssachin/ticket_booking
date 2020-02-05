class User < ApplicationRecord
	has_many :bookings
	has_many :shows, through: :bookings
	has_secure_password
	validates :username, uniqueness: { message: "User Name Must be unique"}
	validates :email, uniqueness: { message: "Email Must be unique"}
	validates :phone, uniqueness: { message: "Phone number Must be unique"}
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
