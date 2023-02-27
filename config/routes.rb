Rails.application.routes.draw do
  root to: 'homes#index', as: 'home'
  get '/tops', to: 'tops#index'
  # devise_for :admins

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end

 
  devise_scope :hospital do
    post '/guest_sign_in', to: 'hospitals/sessions#new_guest'
  end


  # devise_scope :user do
  #   get '/users/auth/line/callback', to: 'users/omniauth_callbacks#line'
  # end
  
  # root to: 'tops#index'

  devise_for :hospitals, controllers: {
    sessions: 'hospitals/sessions',
    password: 'hospitals/password',
    registrations: 'hospitals/registrations'
  }
  resources :hospitals
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
