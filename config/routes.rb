Rails.application.routes.draw do

  # devise_scope :user do
  #   root "users/sessions#new"
  # end
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
