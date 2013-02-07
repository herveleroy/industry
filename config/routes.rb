Ideotron::Application.routes.draw do


  resources :tasks

  resources :knowledges

  get "/search_knowledges", to: 'knowledges#search', as: :search_knowledges
  post "/add_knowledges_ideas", to: 'ideas#add_knowledges', as: :add_knowledges_ideas
  post "/add_knowledges_caterpillars", to: 'caterpillars#add_knowledges', as: :add_knowledges_caterpillars

  resources :entities

  devise_for :users


  resources :ideas do
    get :like, on: :member
    post :add_knowledges, on: :member
    resources :comments
  end

  resources :caterpillars do
    get :like, on: :member
    post :add_knowledges, on: :member
    resources :comments
  end

  resources :comments

  root :to => 'welcome#index'

end
