Rails.application.routes.draw do
  get '/tops', to: 'tops#index'
  # devise_for :admins

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_scope :user do
  #   root "users/sessions#new"
  # end


  # namespace :admins do
  #   resources :mains
  # end

  # devise_for :admins, controllers: {
  #   session: 'admins/sessions',
  #   password: 'admins/passwords',
  #   registrations: 'admins/registrations'
  # }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  # root to: 'mains#index'

  devise_for :hospitals, controllers: {
    sessions: 'hospitals/sessions',
    password: 'hospitals/password',
    registrations: 'hospitals/registrations'
  }
  devise_scope :hospital do
    get '/hospitals/sign_out' => 'hospitals/sessions#destroy'
  end
  root to: 'medical_departments#index'
  resources :medical_departments 
  resources :mains
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
