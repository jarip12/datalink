Rails.application.routes.draw do

  class AdminConstraint
    def self.matches?(request)
      Login.current_staff(request.session)
    end
  end

  resources :family_relations

  resources :notary_relateds
  resources :property_relateds
  resources :family_relateds
  resources :notary_foreign_tables do
  end

  get 'profiles/search', to: 'profiles#search', as: :search_profiles
  get 'profiles/new', to: 'profiles#new_archive', as: :new_profile
  resources :profiles, only: [:show, :edit, :create, :update]

  resources :archives do
    get :autocomplete_user_email, :on => :collection

    get 'family_relations', to: 'family_relations#index'
    get 'family_relation_tree', to: 'family_relations#index_tree'

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

  #for staffs
  devise_for :staffs, controllers: { passwords: "staffs/passwords", sessions: "staffs/sessions", registrations: "staffs/registrations"}
  resources :staffs, except: [:show]

  post 'members', to: 'staffs#create'

  get "/data/lwnotary-datalake-uploads/(*link)" => redirect("/upload_files/%{link}.%{format}")

  mount Api::Dispatch => '/api'
  constraints(AdminConstraint) do
    mount RailsSettingsUi::Engine, at: 'settings'
  end

end
