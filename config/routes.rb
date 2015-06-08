Rails.application.routes.draw do
  

 resources :cuisines


get "signin" => "sessions#new"
get "signup" => "users#new"

resource :session

resources :users
  root "places#index"

get "places/filter/:scope" => "places#index", as: :filter
get "user/reviews" => "users#user_reviews", as: :user_reviews
  resources :places do
    resources :reviews
    resources :check_ins
  end
end
