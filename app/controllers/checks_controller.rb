class ChecksController < ApplicationController

  def create

    @datacheck = Check.where(customer_id: params[:customer_id])
    @disp = Customer.where(id: params[:customer_id]).select("name")

    if @datacheck.count < 1
      checks = current_employee.checks.create(customer_id: params[:customer_id])
      redirect_to customer_managements_path flash[:notice] = "状況確認を確認したい会社に設定しました。"
    else
      redirect_to customer_managements_path flash[:notice] = "既に状況確認に設定されてます。"
    end
  end

  def destroy
    @datacheck = Check.where(customer_id: params[:customer_id])

    if @datacheck.count == 0
      redirect_to customer_managements_path flash[:notice] = "状況確認に設定されてません。"
    else
      checks = current_employee.checks.find_by(customer_id: params[:customer_id]).destroy
      redirect_to customer_managements_path flash[:notice] = "状況確認を解除にしました。"
    end
  end

end