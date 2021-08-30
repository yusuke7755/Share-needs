class EmployeesController < ApplicationController
  before_action :authenticate_employee!, except: %i[guest_sign_in admin_guest_sign_in]

  def guest_sign_in
    user = Employee.guest
    sign_in user
    redirect_to customer_managements_path, notice: 'ゲストユーザーでログインしました'
  end

  def admin_guest_sign_in
    user = Employee.admin_guest
    sign_in user
    redirect_to customer_managements_path, notice: 'ゲスト管理者でログインしました'
  end

  def guest_sign_in
    user = Employee.guest
    sign_in user
    redirect_to customer_managements_path, notice: 'ゲストユーザーでログインしました'
  end

end
