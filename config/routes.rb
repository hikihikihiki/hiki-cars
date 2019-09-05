Rails.application.routes.draw do
  
  resources :users, only: %i(show index leave new)
  resources :mycars, only: %i(index search)
  resources :maker, only: %i(create destroy)

  get 'welcome/index'
  
  devise_for :users, controllers: {
    :confirmations => 'users/confirmations',
  }
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    patch "users/confirm" => "users/confirmations#confirm"
  end
end
