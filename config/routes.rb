Mayfly::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
  #devise_scope :user do
  #    post 'users/sign_in' => "sessions#create"
  #end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  
  #Routes for devices
	post 'devices/create'=> 'devices#create'
  post 'devices/update' => 'devices#update'
  post 'devices/destroy' => 'devices#destroy'
	
	#Routes for friendships
	post 'friends/create' => 'friendships#create'
	post 'friends/destroy' => 'friendships#destroy'
	post 'friends/create_from_event' => 'friendships#create_from_event'
	post 'friends/bulk_create' => 'friendships#bulk_create'
  get 'friends' => 'friendships#show'

	#Routes for events
	post 'events/create' => 'events#create'
	post 'events/destroy' => 'events#destroy'
	get 'event/:event_id' => 'events#show'

	#Routes for invites
	post 'invites/create' => 'invites#create'
	post 'invites/update' => 'invites#update'
	get 'events' => 'invites#show'
  
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
