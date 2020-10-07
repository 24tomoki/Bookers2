Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :books do
  resources :book_comments,only: [:create, :destroy]
  post 'favorite' => 'favorites#create', as: 'create_favorite'
  delete 'favorite' => 'favorites#destroy', as: 'destroy_favorite'
  end
  get '/home/about', to: 'homes#about'  #  => top.html.erb
  root :to => 'homes#top'
end
