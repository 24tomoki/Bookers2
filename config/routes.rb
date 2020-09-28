Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :books
  get '/home/about', to: 'homes#about'  #  => top.html.erb
  root :to => 'homes#top'
end
