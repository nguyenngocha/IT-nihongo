Rails.application.routes.draw do
  post "/rate" => "rater#create", as: "rate"
  mount Ckeditor::Engine => "/ckeditor"
  root "static_pages#home"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
  }

  namespace :admin do
    root controller: :dashboard, action: :home, as: :root
    resources :users, except: :show
    resources :musical_instruments
    resources :posts, only: [:show, :destroy]
    resources :comments, only: [:destroy, :show]
  end

  resources :posts
  resources :comments
  resources :user_items
  resources :top_pages
  resources :users
end
