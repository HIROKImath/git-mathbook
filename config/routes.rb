Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'

  resources :users, only: [:index, :show, :edit, :update]
  get 'users/:id/userbooks', to: 'users#userbooks',as: 'show_userbooks'

  resources :books do
    resources :book_articles
    resources :book_images
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
