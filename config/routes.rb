Ideotron::Application.routes.draw do

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forums'


  resources :taxon_rules

  match 'apply_rules' => 'taxon_rules#apply_rules', :as => :apply_rules

  resources :taxinomies

  match 'arrange_taxinomy' => 'taxinomies#arrange', :as => :arrange_taxinomy
  match 'add_tag_to_dimension' => 'taxinomies#add_tag_to_dimension', :as => :add_tag_to_dimension
  match 'remove_tag_from_dimension' =>'taxinomies#remove_tag_from_dimension', :as => :remove_tag_from_dimension


  resources :challenges

  get "/dendogram", to: 'reporting#dendogram', as: :dendogram
  get "/sankey", to: 'reporting#sankey', as: :sankey
  get "/dynamic_tree", to: 'reporting#dynamic_tree', as: :dynamic_tree
  get "/pack_hierarchy", to: 'reporting#pack_hierarchy', as: :pack_hierarchy
  get "/afm", to: 'reporting#afm', as: :afm

  match "/set_challenge/:challenge", to: 'users#set_challenge', as: :set_challenge


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

  # methods for butterfly
  get "/search_butterflies", to: 'butterflies#search', as: :search_butterflies
  post "/butterflies/:id/event/:event", to: 'butterflies#event', as: :event_butterflies

  resources :entities

  resources :tags do
    get 'autocomplete_tag_name', :on => :collection
  end

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
    post :transform_to_chrysali, on: :collection
    resources :comments
  end

  resources :chrysalis do
    get :like, on: :member
    post :add_knowledges, on: :member
    post :add_caterpillars, on: :member
    post :add_tags, on: :collection
    post :transform_to_butterfly, on: :collection
    resources :comments
  end

  resources :butterflies do
    get :like, on: :member
    post :add_knowledges, on: :member
    post :add_chrysalis, on: :member
    post :add_tags, on: :collection
    resources :comments
  end

  resources :comments

  match 'maintenance_tag/index' => 'maintenance_tag#index', :as => :maintenance_tag
  match 'maintenance_tag/search_tag' => 'maintenance_tag#search_tag', :as => :search_tag
  match 'maintenance_tag/add_taxon_rule' => 'maintenance_tag#add_taxon_rule', :as => :add_taxon_rule


  root :to => 'welcome#index'

  # namespace :user do
  #   root :to => "challenges#index"
  # end

end
