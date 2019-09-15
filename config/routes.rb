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
  resources :makers,only: %i(create edit update destroy index)
  resources :mycars,only: %i(create edit update destroy index new)
  end

  resources :users, only: %i(show leave new edit destroy create update)
  resources :mycars, only: %i(index new edit destroy create update)
  get'/mycars/search' => 'mycars#search'
  root 'mycars#top'


  resources :comments, only: %i(show create edit update)
  get  'comments/new' => 'comments#new', as: 'new_comments'

end
