Rails.application.routes.draw do

  root 'customer_managements#top' #追記

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :employees
    post 'employees/guest_sign_in', to: 'employees#guest_sign_in'
    post 'employees/admin_guest_sign_in', to: 'employees#admin_guest_sign_in'

 
  resources :main_menus, :features ,:customers, :customerusers 
  resources :checks, only: [ :create ,:destroy]

 # selectからremote: trueでpostされるデータを受け取り、getで描画するための準備
 match 'department_employee', to: 'customer_managements#department_employee', via: [:get, :post]
 match 'customer_customeruser', to: 'customer_managements#customer_customeruser', via: [:get, :post]
 match 'package_feature', to: 'customer_managements#package_feature', via: [:get, :post]

  resources :customer_managements 

end
