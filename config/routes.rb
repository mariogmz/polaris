require 'api_constraints'

Polaris::Application.routes.draw do
  resources :recordatorios, only: [:new, :create, :destroy, :edit, :update]

  devise_for :users
  root "static_pages#home"
  devise_scope :user do
    match "signin",       to:   "devise/sessions#new",          via: :get
    match "signout",      to:   "devise/sessions#destroy",      via: :get
    match "registro",     to:   "devise/registrations#new",     via: :get 
    match "editarcuenta", to:   "devise/registrations#edit",    via: :get
    match "borrarcuenta", to:   "devise/registrations#cancel",  via: :get
    match "reestablecer", to:   "devise/passwords#new",         via: :get
  end
  match 'acercade', to: 'static_pages#about', via: :get
  match 'contacto', to: 'static_pages#contact', via: :get
  match 'secret', to: 'static_pages#secret', via: [:get,:post]
  namespace :api, defaults: { format: 'json' } do
    # match 'create', to: "registrations#create", via: :post
    # match 'login', to: "sessions#create", via: :post
    # match 'logout', to: "sessions#destroy", via: :destroy
    # devise_for :users
    devise_scope :user do
      post 'register' => "registrations#register"
      post 'login' => 'sessions#create'
      delete 'logout' => 'sessions#destroy'
    end
    resources :reminders, only: [:create, :update, :destroy, :index]
  end

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

  # Example resource route with concerns:
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
