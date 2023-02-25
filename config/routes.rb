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
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  # devise_scope :user do
  #   get '/users/auth/line/callback', to: 'users/omniauth_callbacks#line'
  # end
  
  root to: 'tops#index'

  devise_for :hospitals, controllers: {
    sessions: 'hospitals/sessions',
    password: 'hospitals/password',
    registrations: 'hospitals/registrations'
  }
  resource :hospital
  devise_scope :hospital do
    get '/hospitals/sign_out' => 'hospitals/sessions#destroy'
  end
  # root to: 'medical_departments#index'
  post '/play_audio', to: 'medical_appointments#play_audio'
  resources :medical_departments, only:[:index, :show] 
  resources :mains
  resources :medical_appointments
  namespace :hospitals do
    resources :medical_departments
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
