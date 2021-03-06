Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations'}
  root 'posts#index'

  resources :posts
  resources :users, only: [:show, :edit, :update] do
    resources :feedbacks, only: [:create]
  end
end
