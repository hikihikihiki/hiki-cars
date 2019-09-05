Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  get 'users/leave'
  get 'users/new'
  get 'mycars/index'
  get 'mycars/search'
  get 'welcome/index'
  devise_for :users, controllers: {
    :confirmations => 'users/confirmations',
  }
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    patch "users/confirm" => "users/confirmations#confirm"
  end
end
