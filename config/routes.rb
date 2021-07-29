Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  resources :books,only: [:index,:edit,:create,:update,:destroy,:show] do
    resources :book_comments,only: [:create,:destroy]
    resource :favorites, only: [:create,:destroy]
  end

  get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end