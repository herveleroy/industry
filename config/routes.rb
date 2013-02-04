Ideotron::Application.routes.draw do
  resources :entities

  devise_for :users

  resources :ideas do
    get :like, on: :member
    get :dislike, on: :member
    resources :comments
  end

  resources :comments


  root :to => 'welcome#index'

end
