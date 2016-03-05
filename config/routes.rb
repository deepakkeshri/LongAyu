Rails.application.routes.draw do
  resources :patient_facility_insurances

  resources :clinic_facility_travellers

  resources :premises

  resources :payment_infos

  resources :addresses

  get 'profile/index'

  get 'profile/create'

  get 'profile/update'

  get 'profile/delete'

  get 'profile/show'

  get 'profile/read'

  resources :beauty_services

  resources :medicines

  resources :medical_tests

  devise_for :accounts,:controllers => {registrations: 'registrations',sessions: 'sessions'}
  devise_scope :account do
    get 'branch/sign_up' => 'registrations#new_branch' 
    post 'branch/sign_up' => 'registrations#create_branch'
    get 'centre/sign_up' => 'registrations#new_centre'
    post 'centre/sign_up' => 'registrations#create_centre'
    get  'branch/sign_in' => 'sessions#new_branch' 
    post 'branch/sign_in' => 'sessions#create_branch'
    get 'centre/sign_in' => 'sessions#new_centre' 
    post 'centre/sign_in' => 'sessions#create_centre'
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'welcome/demoindex' => 'welcome#demoindex'
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  
  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :welcome,:accounts,:properties,:patients,:staffs,:facilities,:profile
  
  get 'services/:id/index2' => 'services#index2',as: :branch_services
  get 'facility/:id/index2' => 'facilities#index2',as: :branch_facilities
  get 'services/book/:id' => 'services#book',as: :book_service
  get 'services/data_import' => 'services#data_import'
  get 'centres/data_import' => 'centres#data_import'
  resources :services do
    collection { post :import }
  end

  resources :centres do
    collection { post :import }
  end

  resources :centre_types do
    collection { post :import }
  end

  resources :staff_types do
    collection { post :import }
  end
  
  resources :facility_types do
    collection { post :import }
  end
  resources :service_types do
    collection { post :import }
  end

  resources :search do
    collection { get :index_app }
  end
  
  namespace :api, :path => "", :defaults => {:format => :json} do
    namespace :v1 do
      resources :search
      resources :registrations
    end
  end
  
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
