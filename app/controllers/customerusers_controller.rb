class CustomerusersController < ApplicationController
  before_action :set_user, only: %i[edit update show destroy]

  def new
    @customeruser = Customeruser.new
    @customer = Customer.all
  end

  def index

    if params[:search].present?
      @customerusers = Customeruser.where(customer_id: params[:search][:customer_id]).page(params[:page]).per(10)
    else
      @customerusers = nil
    end

  end

  def edit

    @Customeruser = Customeruser.find(params[:id])
    @customer = Customer.where(id: @Customeruser.customer_id)

  end

  def destroy

    chkproject = Project.where(customeruser_id: params[:id] )

    if chkproject.count > 0
      redirect_to customerusers_path flash[:notice] = "レポートに登録のあるユーザーは削除できません。"
      # render :edit
    else
      @customeruser.destroy
      redirect_to customerusers_path flash[:notice] = "ユーザを削除しました。"
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
    @customeruser = Customeruser.new(customeruser_params)
    if @customeruser.save
      redirect_to new_customeruser_path flash[:notice] = "ユーザ登録しました。"
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
