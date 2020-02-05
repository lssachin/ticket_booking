def init
	clean_data
	create_movies
	create_users
	create_theaters
	create_shows
	create_bookings
	create_coupons
end

def clean_data
	ActiveRecord::Base.connection.execute "SET FOREIGN_KEY_CHECKS = 0"
	ActiveRecord::Base.connection.execute "truncate bookings"
	ActiveRecord::Base.connection.execute "truncate shows"
	ActiveRecord::Base.connection.execute "truncate movies"
	ActiveRecord::Base.connection.execute "truncate theaters"
	ActiveRecord::Base.connection.execute "truncate users"
	ActiveRecord::Base.connection.execute "SET FOREIGN_KEY_CHECKS = 1"
end

def create_movies
	10.times do |n|
		Movie.create(name: "Movie #{n + 1}", screen_date: Date.today + n.days)
	end
end

def create_users
	User.create(
		username: "john", 
		password: "Welcome@123", 
		first_name: "John", 
		last_name: "Smith", 
		gender: "M", 
		email: "john@test.com", 
		phone: "9538702278"
	)
	User.create(
		username: "rekha", 
		password: "Welcome@123", 
		first_name: "Rekha", 
		last_name: "Paul", 
		gender: "F", 
		email: "rekha@test.com", 
		phone: "9036960512"
	)
end

def create_theaters
	seats = [50, 75, 100, 125, 150]
	5.times do |n|
		Theater.create(
			name: "Theater #{n + 1}",
			seats: seats[n]
		)
	end
end

def create_shows
	10.times do |n|
		movie = Movie.find(n + 1)
		theater = Theater.find((n%5)+1)
		(movie.screen_date.to_date..(movie.screen_date+ 7.days).to_date).each do |date|
			4.times do |n|
				Show.create(
					show_date: date,
					movie_id: movie.id,
					theater_id: theater.id,
					show_time: Time.parse("#{date.to_s} #{10+(n*4)}:00:00"),
					price: (100 + (50*n))
				)
			end
		end
	end
end

def create_bookings
	users = User.all
	Show.all.each_with_index do |show,i|
		user = users[i%users.size]
		tickets = show.theater.seats/2
		Booking.create(
			user_id: user.id,
			show_id: show.id,
			no_of_tickets: tickets,
			order_value: (user.gender == "F" ? tickets*show.price*0.95 : tickets*show.price)
		)
	end
end

def create_coupons
	Coupon.create(code: "ABC", discount: 100)
	Coupon.create(code: "XYZ", discount: 50)
end

init