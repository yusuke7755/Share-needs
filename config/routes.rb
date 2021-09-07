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

  resources :customer_managements do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_department', defaults: { format: 'json' }
      get 'get_category_employee', defaults: { format: 'json' }
    end
  end
end
