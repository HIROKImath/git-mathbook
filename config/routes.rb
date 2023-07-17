Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'

  resources :users, only: [:index, :show, :edit, :update]

  resources :books, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :book_images, only: [:new, :edit, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
