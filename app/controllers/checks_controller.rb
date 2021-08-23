class ChecksController < ApplicationController

  def create

    @datacheck = Check.where(customeruser_id: params[:customeruser_id])
    @disp = Customer.where(id: params[:customeruser_id])
    if @datacheck.count < 1
      checks = current_employee.checks.create(customeruser_id: params[:customeruser_id])
      redirect_to customer_managements_path flash[:notice] =   "#{@disp.name}の状況確認を設定しました。"
    else
      checks = current_employee.checks.find_by(customeruser_id: params[:customeruser_id]).destroy
      redirect_to customer_managements_path flash[:notice] =   "#{@disp.name}の状況確認を解除にしました。"
    end
  end

end