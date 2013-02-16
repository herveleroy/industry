Ideotron::Application.routes.draw do

  resources :chrysalis

  get "/dendogram", to: 'reporting#dendogram', as: :dendogram
  get "/sankey", to: 'reporting#sankey', as: :sankey
  get "/dynamic_tree", to: 'reporting#dynamic_tree', as: :dynamic_tree

  resources :documents

  resources :tasks

  resources :knowledges

  # method for knowledge
  get "/search_knowledges", to: 'knowledges#search', as: :search_knowledges

  # method for idea
  get "/search_ideas", to: 'ideas#search', as: :search_ideas


  # methods for chrysali
  get "/search_chrysalis", to: 'chrysalis#search', as: :search_chrysalis
  post "/chrysalis/:id/event/:event", to: 'chrysalis#event', as: :event_chrysalis

  # methods for caterpillar
  get "/search_caterpillars", to: 'caterpillars#search', as: :search_caterpillars
  post "/caterpillars/:id/event/:event", to: 'caterpillars#event', as: :event_caterpillars

  resources :entities

  devise_for :users

  devise_for :users, :controllers => { :registrations => :registrations, :confirmations => :confirmations }
  resources :users


  resources :ideas do
    get :like, on: :member
    post :add_knowledges, on: :member
    post :add_caterpillars, on: :member
    post :add_tags, on: :collection
    post :transform_to_caterpillar, on: :collection
    resources :comments
  end

  resources :caterpillars do
    get :like, on: :member
    post :add_knowledges, on: :member
    post :add_ideas, on: :member
    post :add_tags, on: :collection
    resources :comments
  end

  resources :chrysalis do
    get :like, on: :member
    post :add_knowledges, on: :member
    post :add_caterpillars, on: :member
    post :add_tags, on: :collection
    resources :comments
  end

  resources :comments

  root :to => 'welcome#index'

end
