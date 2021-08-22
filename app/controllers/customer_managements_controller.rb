class CustomerManagementsController < ApplicationController
  before_action :authenticate_employee!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_project, only: %i[edit update show]

  def new
    @project = Project.new
    @department = Department.where(web_flg: true)
    @customer = Customer.all
    @package = Package.all
  end
  
  def set_employee
    # employeesをdepartment_idで絞り込んで取得する。
    @employee = Employee.where(department_id: params[:department][:department_id])
  end

  def index
    @q = Project.ransack(params[:q])
    if params[:sort_checked].present?

      @check = Check.where(employee_id: current_employee.id)
      if @check.count > 0

        @customer = []
        @check.all.each do |ck|
          @customer << ck.customername
        end

        @projects = Project.where(customer: @customer).page(params[:page]).per(5)
        
      else
         flash[:notice] = "状況管理しているものはありません。"
      end
    else
      @projects = @q.result.order("apoint_at asc").page(params[:page]).per(5)
    end

  end

  def search
  end

  def edit
    @projects = Project.find(params[:id])
    @department = Department.where(web_flg: true)
    @customer = Customer.all
    @package = Package.all
  end

  def show
  end

  def update
    #binding.pry
    if @project.update(project_params)
      redirect_to customer_managements_path  flash[:notice] = "レポートが編集されました。"
    else
      redirect_to customer_managements_path  flash[:notice] = "レポートの編集が失敗しました。"
    end
  end


  def create

    #所属部署の社員であるかチェックする
#      checkdepartment = Department.where(name: project_params[:department])
#      checkemployee = Employee.where(id: project_params[:employee_id])
# binding.pry
#      if checkdepartment.id != checkemployee.department_id
#        errors.add("所属部署の社員を選択してください")
#        throw(:abort)
#      end

    @project =Project.new(project_params)
    # binding.pry
      if @project.save
        redirect_to new_customer_management_path  flash[:notice] = "レポートが作成されました。"
      else
        redirect_to new_customer_management_path  flash[:notice] = "レポートの作成が失敗しました。"
      end
  end

  private
  
  def set_project
    @project = Project.find(params[:id])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_flg])
  end

  def project_params
    # binding.pry
    params.require(:project).permit(:title, :employee_id, :department, :customer, :customeruser_id, :package, :feature_id, :description, :apoint_at, :priority, :deadline  )
  end

end