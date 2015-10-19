Rails.application.routes.draw do

  resources :family_relations
  resources :notary_relateds
  resources :property_relateds
  resources :family_relateds, only: [:post, :update]

  resources :archives do
    get :autocomplete_user_email, :on => :collection
    get 'profile/edit', to: 'profiles#edit'
    get 'profile', to: 'profiles#show'
    patch 'profile', to: 'profiles#update'

    get 'property_related/edit', to: 'property_relateds#edit'
    get 'property_related', to: 'property_relateds#show'
    patch 'property_related', to: 'property_relateds#update'

    get 'notary_related/edit', to: 'notary_relateds#edit'
    get 'notary_related', to: 'notary_relateds#show'
    patch 'notary_related', to: 'notary_relateds#update'

    get 'family_related/edit', to: 'family_relateds#edit'
    get 'notary_related', to: 'notary_relateds#show'
    patch 'notary_related', to: 'notary_relateds#update'

    #get 'family_relation/edit', to: 'family_relations#edit'
    #get 'family_relation', to: 'family_relations#show'
    get 'family_relations', to: 'family_relations#index'
    #patch 'family_relation', to: 'family_relations#update'

    get 'notaries', to: 'notaries#index'
    get 'notary_records', to: 'archives#notary_records'

  end

  get 'profiles/search', to: 'profiles#search', as: :search_profiles

  resources :reservations do
    get 'handle', to: 'reservations#handle'
  end


  root 'dashboard#index'
  get 'dashboard/index'

  #for users
  devise_for :users, controllers: { passwords: "users/passwords", sessions: "users/sessions", registrations: "users/registrations"}
  resources :users

  #for staffs
  resources :staffs, except: [:show]
  devise_for :staffs, controllers: { passwords: "staffs/passwords", sessions: "staffs/sessions", registrations: "staffs/registrations"}
  post 'members', to: 'staffs#create'

  mount Api::Dispatch => '/api'
  mount RailsSettingsUi::Engine, at: 'settings'

end
