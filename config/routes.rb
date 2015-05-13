Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  root 'pages#index'

  get '/events', to: 'events#index'
  get '/events/create', to: 'events#index', as: 'new_event'

  get '/events/create/wedding/', to: 'events#wedding_new', as: 'new_wedding'

  match 'e/rsvp', to: 'events#rsvp_new', as: 'new_rsvp', via: [:post, :get]
  get 'e/:event_slug', to: 'events#show', as: 'show_event'

  get 'my_events', to: 'events#show_user_events', as: 'user_events'


end
