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
     @projects = @q.result.order("apoint_at asc").page(params[:page]).per(5)
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


  def create
    @project =Project.new(project_params)
      # binding.pry
      if @project.save
        redirect_to customer_managements_path  flash[:notice] = "レポートが作成されました。"
      else
        # binding.pry
        redirect_to customer_managements_path  flash[:notice] = "レポートの作成が失敗しました。"
      end
  end

  def update
    #binding.pry
    if @project.update(project_params)
      redirect_to customer_managements_path  flash[:notice] = "レポートが編集されました。"
    else
      redirect_to customer_managements_path  flash[:notice] = "レポートの編集が失敗しました。"
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
    params.require(:project).permit(:title, :employee_id, :department, :customer, :customeruser_id, :package, :feature_id, :description, :apoint_at, :priority, :deadline  )
  end

end