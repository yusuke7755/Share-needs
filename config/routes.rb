Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'customer_managements#index' #追記
  devise_for :employees
  resources :main_menus, :features ,:customers, :customerusers 
  resources :checks, only: [ :create ,:destroy]
  resources :customer_managements
end
