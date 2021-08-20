Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'customer_managements#index' #追記
  devise_for :employees
  resources :main_menus, :features ,:customers, :customerusers 
 
  resources :customer_managements do
    collection do
      get 'check'
    end
  end

  # selectからremote: trueでpostされるデータを受け取り、getで描画するための準備
  match 'set_employee', to: 'customer_managements#set_employee', via: [:get, :post]

end
