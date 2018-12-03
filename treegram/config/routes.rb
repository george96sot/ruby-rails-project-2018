Rails.application.routes.draw do
  get '/' => 'home#index2'
  resources :users do
    resources :photos
  end

  resources :tags, only: [:create, :destroy]

  get '/register' => 'home#register'
  get '/login' => 'home#login'

  get '/log-in' => "sessions#new"
  post '/log-in' => "sessions#create"
  get '/log-out' => "sessions#destroy", as: :log_out

  get '/users/:id/all_users' => 'users#all_users', as: 'all_users'
  get '/users/:id/posts' => 'users#posts', as: 'posts'
  get '/users/:id/followers' => 'users#followers', as: 'followers'
  get '/users/:id/following' => 'users#following', as: 'following'

  post '/users/:id/all_users/:following_id' => 'follow#createFollow', as: 'follow'
  post '/users/:id/posts/:image_id' => 'comments#createComment', as: 'comment'
  get '/users/:id/posts/:image_id/delete' => 'photos#delete' , as: 'delete_photo'


end
