Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/new'
  get 'categories/edit', to: 'categories#edit'
  get '/search',to: "books#search"
  devise_for :users
  devise_scope :user do
     get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :books
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'books#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
