Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'movies#index'
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :movies
  get '/search' => 'movies#search', :as => 'search_movie'

end
