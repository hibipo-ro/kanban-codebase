Rails.application.routes.draw do
  devise_for :users
  root 'top#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :list, only: %i(new create edit update destroy) do
    resources :cards
  end
end
