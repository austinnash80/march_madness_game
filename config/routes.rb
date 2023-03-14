Rails.application.routes.draw do
  resources :picks
  resources :group_members
  resources :groups
  resources :schools
# get 'home', to: 'pages#home', as: 'home'
get 'signup', to: 'users#new', as: 'signup'
get 'login', to: 'sessions#new', as: 'login'
get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'pages/home'
  get 'pages/live_draft'

resources :users
resources :sessions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
root "pages#home"
end
