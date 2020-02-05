# Ticket Booking

A simple Event Management System

## Installation and running application

```ruby
	bundle install
	rake db:create
	rake db:migrate
	rails runner seed_data.rb
	rails -s
```

### Requirements
	ruby
	mysql

### Usecases
	I Should be able to signup and signin and signout
	I Should be able to view all my bookings
	I Should be able to browse and book tickets for any movie
	I Should be able to Cancel my booking
	I Should be able to Cancel all my booking of a particular show
	I Should not be able to Cancel expired bookings
	If i am female user i should get 5% discount by default
	If i apply a valid coupon my order value should be reduced by coupon amount


### Asumptions
	User Can create multiple bookings for the same show
	Username, Email, Phone is unique between all the users
	Coupon code are only for flat discounts, but not in percentages on the order value
	Female users get 5% discount by default without applying coupon code
	There is no min order value for the discount
