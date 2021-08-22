class CustomerusersController < ApplicationController

  def new
    @user = Customeruser.new
    @customer = Customer.all
  end

  def create
    @customeruser = Customeruser.new(customeruser_params)
    if @customeruser.save
      redirect_to new_customeruser_path flash[:notice] = "ユーザ登録しました。"
    else
      redirect_to new_customeruser_path flash[:notice] = "ユーザ登録が失敗しました。"
    end
  end

  private

  def customeruser_params
    params.require(:customeruser).permit(:customer_id, :department, :name, :email, :tel, :meta)
  end

end
