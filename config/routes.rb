Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#home', :as => :home
  get '/activity/index' => 'activities#index', :as => :index
  get '/activity/new' => 'activities#new', :as => :new
  post '/activity/create' => 'activities#create', :as => :activities
  put '/activity/update/:id' => 'activities#update', :as => :update_activity
  get '/activity/show/:id' => 'activities#show', :as => :show
  get '/activity/edit/:id' =>'activities#edit', :as => :edit

  get '/myactivity/index' => 'activity_users#index', :as => :activity_user_index
  get '/myactivity/new' => 'activity_users#new', :as => :activity_user_new
  post '/myactivity/create' => 'activity_users#create', :as => :activity_user_create
  get '/myactivity/edit/:id' => 'activity_users#edit', :as => :activity_user_edit
  patch '/myactivity/update/:id' => 'activity_users#update', :as => :activity_user_update
  delete '/myactivity/delete/:id' => 'activity_users#destroy', :as => :activity_user_destroy
  # Defines the root path route ("/")
  # root "articles#index"
end
