Rails.application.routes.draw do

  resources :family_relations

  resources :notary_relateds
  resources :property_relateds
  resources :family_relateds
  resources :notary_foreign_tables do
    get 'as_pdf'
  end

  get 'profiles/search', to: 'profiles#search', as: :search_profiles
  get 'profiles/new', to: 'profiles#new_archive', as: :new_profile
  resources :profiles, only: [:edit, :create, :update]

  resources :archives do
    get :autocomplete_user_email, :on => :collection

    get 'family_relations', to: 'family_relations#index'
    get 'family_relations_tree', to: 'family_relations#index_tree'

    get 'notaries', to: 'notaries#index'
    get 'notary_records', to: 'archives#notary_records'

  end



  get 'reservations/query', to: 'reservations#query'
  post 'reservations/query', to: 'reservations#do_query'
  resources :reservations do
    get 'handle', to: 'reservations#handle'
  end


  root 'dashboard#index'
  get 'dashboard/index'

  #for users
  devise_for :users, controllers: { passwords: "users/passwords", sessions: "users/sessions", registrations: "users/registrations"}
  resources :users

  #for staffs
  resources :staffs, except: [:show, :destroy]
  devise_for :staffs, controllers: { passwords: "staffs/passwords", sessions: "staffs/sessions", registrations: "staffs/registrations"}
  post 'members', to: 'staffs#create'

  mount Api::Dispatch => '/api'
  mount RailsSettingsUi::Engine, at: 'settings'

end
