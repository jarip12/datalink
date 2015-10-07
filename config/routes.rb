Rails.application.routes.draw do

  resources :family_relations
  resources :notary_relateds
  resources :archives do
    get :autocomplete_user_email, :on => :collection
    get 'profile/edit', to: 'profiles#edit'
    get 'profile', to: 'profiles#show'
    patch 'profile', to: 'profiles#update'

    get 'property/edit', to: 'properties#edit'
    get 'property', to: 'properties#show'
    patch 'property', to: 'properties#update'

    get 'notary_related/edit', to: 'notary_relateds#edit'
    get 'notary_related', to: 'notary_relateds#show'
    patch 'notary_related', to: 'notary_relateds#update'

    get 'family_relation/edit', to: 'family_relations#edit'
    get 'family_relation', to: 'family_relations#show'
    get 'family_relations', to: 'family_relations#index'
    patch 'family_relation', to: 'family_relations#update'

    get 'notaries', to: 'notaries#index'

  end

  get 'profiles/search', to: 'profiles#search', as: :search_profiles

  resources :reservations



  get 'dashboard/index'

  mount RailsSettingsUi::Engine, at: 'settings'

  root 'dashboard#index'

  devise_for :users, controllers: { passwords: "users/passwords", sessions: "users/sessions", registrations: "users/registrations"}
  devise_for :staffs, controllers: { passwords: "staffs/passwords", sessions: "staffs/sessions", registrations: "staffs/registrations"}
  resources :users
  resources :staffs

  post 'members', to: 'staffs#create'
  mount Api::Dispatch => '/api'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concernse
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
