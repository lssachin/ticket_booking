Rails.application.routes.draw do
  root :to => "movies#index"
  resources :users, only: [:new, :create]
  get 'mybookings', to: 'bookings#index'
  get 'shows/:show_id/book', to: 'bookings#new'
  post 'shows/:show_id/book', to: 'bookings#create'
  get 'movies/:movie_id/theaters', to: 'theaters#index'
  get 'login', to: 'sessions#new'
  patch 'bookings/:id/cancel', to: 'bookings#cancel'
  patch 'bookings/shows/:show_id/cancel_all', to: 'bookings#cancel_all'
  get 'logout', to: 'sessions#logout'
  post 'login', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
