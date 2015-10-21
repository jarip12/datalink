Rails.application.routes.draw do

  resources :family_relations

  resources :notary_relateds
  resources :property_relateds
  resources :family_relateds
  resources :notary_foreign_tables

  get 'profiles/search', to: 'profiles#search', as: :search_profiles
  resources :profiles


  resources :archives do
    get :autocomplete_user_email, :on => :collection

    #get 'property_related/edit', to: 'property_relateds#edit'
    #get 'property_related', to: 'property_relateds#show'
    #patch 'property_related', to: 'property_relateds#update'

    get 'family_relations', to: 'family_relations#index'

    get 'notaries', to: 'notaries#index'
    get 'notary_records', to: 'archives#notary_records'

  end



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
