class CustomersController < ApplicationController
  before_action :authenticate_employee!

  def new
    @customer = Customer.new
  end

  def index
    # binding.pry
    # @q = Customer.ransack(params[:q])
    # @result = @q.result
    # @customers = Customer.all
  end

  def create
    @customer = Customer.new(customer_params)
      binding.pry
      if @customer.save
        redirect_to new_customer_path flash[:notice] = "お客様登録しました。"
      else
        redirect_to new_customer_path flash[:notice] = "お客様登録に失敗しました。"
      end
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :name, :address, :tel, :user_flg )
  end

end
