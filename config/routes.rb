Rails.application.routes.draw do

  devise_for :admins,controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users, controllers: {
    :confirmations => 'users/confirmations',
  }
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  get'/mycars/search' => 'mycars#search'
  get 'welcome/index'

  namespace :admins do

  root to:'admins#index'

  resource :admins,only: %i(index)
  resources :makers,only: %i(create edit update destroy index)
  resources :mycars,only: %i(create edit update destroy index)
  end


  resources :users, only: %i(show index leave new)
  resources :mycars, only: %i(index search)


  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    patch "users/confirm" => "users/confirmations#confirm"
  end
end
