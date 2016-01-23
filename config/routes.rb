Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root to: redirect('pages/user_rules') #'welcomes#show'

  resource  :welcomes
  resources :pages
  resources :private_pages
  resource  :faq
  resources :logs

  namespace :ruboto do
    resources :facts
    resources :commands
  end
end
