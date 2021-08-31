class CustomerusersController < ApplicationController
  before_action :set_user, only: %i[edit update show destroy]

  def new
    @customeruser = Customeruser.new
    @customer = Customer.all
  end

  def index
    @customerusers = Customeruser.all.page(params[:page]).per(10)
    if params[:search].present?
      @customerusers = @customerusers.where(customer_id: params[:search][:customer_id]).page(params[:page]).per(10)
    end

  end

  def edit

    if current_employee.admin == true
        #管理者権限がある場合
        @Customeruser = Customeruser.find(params[:id])
        @customer = Customer.where(id: @Customeruser.customer_id)
     else
        #管理者権限がない場合
        redirect_to customerusers_path  flash[:notice] = "管理者権限がないので編集はできません。"
        @customerusers = Customeruser.all.page(params[:page]).per(10)
     end
  end

  def destroy
    if current_employee.admin == true

      #管理者権限がある場合、
      chkproject = Project.where(customeruser_id: params[:id] )

      if chkproject.count > 0
        redirect_to customerusers_path  flash[:notice] = "レポートに登録のあるユーザーは削除できません。"

      else
        @customeruser.destroy
        redirect_to customerusers_path  flash[:notice] = "ユーザを削除しました。"
      end
    else
      #管理者権限がない場合
      redirect_to customerusers_path flash[:notice] = "管理者権限がないので削除はできません。"
      @customerusers = Customeruser.all.page(params[:page]).per(10)
    end

  end

  def update
    if @customeruser.update(customeruser_params)
      redirect_to customerusers_path  flash[:notice] = "ユーザ情報が編集されました。"
    else
      render :edit
    end
  end

  def create
    @customer = Customer.all
    @customeruser = Customeruser.new(customeruser_params)
    binding.pry
    if @customeruser.save
      redirect_to customerusers_path 
      flash[:notice] = "ユーザ登録しました。"
    else
      render :new
    end
  end

  private

  def set_user
    @customeruser = Customeruser.find(params[:id])
  end

  def customeruser_params
    params.require(:customeruser).permit(:customer_id, :department, :name, :email, :tel, :meta)
  end

end
