Rails.application.routes.draw do

  root 'customer_managements#top' #追記

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :employees
    post 'employees/guest_sign_in', to: 'employees#guest_sign_in'
    post 'employees/admin_guest_sign_in', to: 'employees#admin_guest_sign_in'

 
  resources :main_menus, :features ,:customers, :customerusers 
  resources :checks, only: [ :create ,:destroy]

  resources :customer_managements do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_department', defaults: { format: 'json' }
      get 'get_category_employee', defaults: { format: 'json' }
    end
  end
end
