Rails.application.routes.draw do
  root "static_pages#home"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
  }

  namespace :admin do
    root controller: :dashboard, action: :home, as: :root
    resources :users, except: :show
    resources :musical_instruments
  end
end
