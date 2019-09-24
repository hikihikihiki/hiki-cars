Rails.application.routes.draw do

  devise_for :admins,controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users, controllers: {
    :confirmations => 'users/confirmations',
  }

  devise_scope :user do
    patch "users/confirm" => "users/confirmations#confirm"
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  get 'welcome/index'

  namespace :admins do

  root to:'admins#index'

  resource :admins,only: %i(index)
  #resources :makers,only: %i(create edit update destroy index)
  #resources :mycars,only: %i(create edit update destroy index new)
  end

  get '/users/search' => 'users#search'
  get'/users/leave' => 'users#leave'
  resources :users
  #resources :mycars
  root 'welcome#index'

  #get  'comments/new' => 'comments#new', as: 'new_comments'
  #resources :comments, only: %i(show create edit update)

end
