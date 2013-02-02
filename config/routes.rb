Ideotron::Application.routes.draw do
  resources :entities

  devise_for :users

  resources :ideas do
    get :like, on: :member
    get :dislike, on: :member
  end

  root :to => 'welcome#index'

end
