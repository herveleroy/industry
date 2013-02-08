Ideotron::Application.routes.draw do


  resources :documents

  resources :tasks

  resources :knowledges

  get "/search_knowledges", to: 'knowledges#search', as: :search_knowledges
  get "/search_ideas", to: 'ideas#search', as: :search_ideas
  get "/search_caterpillars", to: 'caterpillars#search', as: :search_caterpillars
  post "/add_knowledges_ideas", to: 'ideas#add_knowledges', as: :add_knowledges_ideas
  post "/add_caterpillars_ideas", to: 'ideas#add_caterpillars', as: :add_caterpillars_ideas
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
