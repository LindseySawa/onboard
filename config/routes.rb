Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: "posts#index"

  resources :users, only:[:show]

  get 'messages' => 'messages#new'
  post 'messages' => 'messages#create'
  # post 'post/:post_id/likes' => 'likes#create'
  # delete 'post/:post_id/likes' => 'likes#destroy'

  resources :posts do 
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
      get 'place'
      get 'map'
      get 'word'
      get 'about'
    end
  end


  # devise_for :users, :controllers => {
  #   :registrations => 'users/registrations',
  #   :sessions => 'users/sessions'   
  # } 

  # devise_scope :user do
  #   get "sign_in", :to => "users/sessions#new"
  #   get "sign_out", :to => "users/sessions#destroy" 
  # end
end
