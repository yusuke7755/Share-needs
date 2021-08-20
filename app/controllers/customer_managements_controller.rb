class CustomerManagementsController < ApplicationController
  before_action :authenticate_employee!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search_customer
  before_action :set_project, only: %i[edit update show create]

  def new
    @project = Project.new
    @department = Department.where(web_flg: true)
    @customers = Customer.all
  end
  
  def set_employee
    # employeesをdepartment_idで絞り込んで取得する。
    @employee = Employee.where(department_id: params[:department][:department_id])
  end


  def index
     @q = Project.ransack(params[:q])
     @projects = @q.result.page(params[:page]).per(5)
    #@projects = @result.joins( :departments, :employees, :customerusers, :features)
     #binding.pry
     #@department = @projects.first.department
  end

  def search
  end

  def edit
    @projects = Project.find(params[:id])
    # @setdata = Project.find(params[:id])
    # @projects = @setdata.features.departments.employees.customerusers
    #@projects = Project.left_joins( :projectdepartments, :projectmembers, :projectusers, :projectfeatures).where(id: params[:id])
    #binding.pry
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
    binding.pry
    if @project.update(project_params)
      redirect_to customer_management_path  flash[:notice] = "レポートが編集されました。"
    else
      redirect_to customer_management_path  flash[:notice] = "レポートの編集が失敗しました。"
    end
  end

  private
  
  def set_project
    @project = Project.find(params[:id])
  end

   def set_search_customer
  #   # @q = Customer.ransack(params[:q])
  #   # @result = @q.result
  #   # flash[:notice] = "検索しました"
   end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_flg])
  end

  def project_params
    params.require(:project).permit(:title,:employee_id, :department_id, :customer_id, :package_id, :description, :apoint_at, :priority, :deadline ,{ department_ids: [] } ,{ employee_ids: [] } ,{ customeruser_ids: [] } , { feature_ids: [] } )

    #params.require(:project).permit(:title, :employee_id, :department_id, :customer_id, :package_id, :description, :apoint_at, :priority, :deadline )
  end
end