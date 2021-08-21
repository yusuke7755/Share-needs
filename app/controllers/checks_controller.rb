class ChecksController < ApplicationController

  def create

    @datacheck = Check.where(customername: params[:customername])
 
    if @datacheck.count < 1
    checks = current_employee.checks.create(customername: params[:customername])
      redirect_to customer_managements_path flash[:notice] =   "#{params[:customername]}の状況確認を設定しました。"
    else
      checks = current_employee.checks.find_by(customername: params[:customername]).destroy
      redirect_to customer_managements_path flash[:notice] =   "#{params[:customername]}の状況確認を解除にしました。"
    end
  end

end