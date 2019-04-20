Rails.application.routes.draw do
  namespace :api, :defaults => { :format => :json } do
   namespace :v1 do
     get "/trains"  => "trains#index", :as => :trains
     get "/trains/:train_number" => "trains#show", :as => :train

     get "/reservations/:booking_code" => "reservations#show", :as => :reservation
     post "/reservations" => "reservations#create", :as => :create_reservations
     patch "/reservations/:booking_code" => "reservations#update", :as => :update_reservation
     delete "/reservations/:booking_code" => "reservations#destroy", :as => :cancel_reservation
   end
 end
  devise_for :users
  root 'posts#index'

  resources :posts do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
