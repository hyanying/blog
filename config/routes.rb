Rails.application.routes.draw do
  
  get '/' => 'posts#index'
  resources :posts

  get 'signup' => 'users#new'
  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :sessions


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
