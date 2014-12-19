Mayfly::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions", :confirmations => 'confirmations'}
  devise_scope :user do
		get 'confirmations/success' => 'confirmations#show_success'
  end
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

end
