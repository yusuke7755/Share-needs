class CustomerManagementsController < ApplicationController
  before_action :authenticate_employee!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_project, only: %i[edit update show]

  def new
    @project = Project.new
    @department = Department.where(web_flg: true)
    @employee = Employee.where(web_flg: true).order(department_id: :ASC).all
    @customeruser = Customeruser.all
    @customer = Customer.all
    @package = Package.all
    @feature = Feature.all
  end
  
  def set_employee
    # employeesをdepartment_idで絞り込んで取得する。
    @employee = Employee.where(department_id: params[:department][:department_id])
  end

  def index
    @department = Department.where(web_flg: true)
    @customer = Customer.all
    # @projects = Project.left_joins(:employee ,:customeruser ,:feature).select("titles.*, employee_ids.*, customeruser_ids.*, feature_ids.*, descriptions.*, prioritys.*, deadlines.*, department_ids.*, customer_ids.*")
    @projects = Project.all


    @q = @projects.ransack(params[:q])
    if params[:sort_checked].present?

          @check = Check.where(employee_id: current_employee.id)
          if @check.count > 0

            @customer = []
            @check.all.each do |ck|
              @customer << ck.customeruser_id
            end

            @projects = Project.where(customeruser_id: @customer).page(params[:page]).per(5)
            
          else
              flash[:notice] = "状況管理しているものはありません。"
          end

    # elsif params[:search].present?
    #    binding.pry 
    #       if params[:search][:department_id].present?
    #         binding.pry
    #         # @projects = @projects.joins(:employees).where(employees: { deparatment_id: params[:search][:department_id] }) 
    #         @projects = @projects.joins(:employees).select(' employees.*, departments.*').where(id: params[:search][:department_id] ) 
    #         binding.pry
    #       end

    #       if params[:search][:customer_id].present?
    #         binding.pry
    #         @projects = @projects.joins(:employees).where(employees: { customer_id: params[:search][:customer_id] })
    #       end

    #       @projects = @projects.order(apoint_at: :ASC).page(params[:page]).per(5)

    #     binding.pry

    else

      # binding.pry
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

    @project =Project.new(project_params)
binding.pry
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
    params.require(:project).permit(:title, :employee_id, :customeruser_id, :feature_id, :description, :apoint_at, :priority, :deadline  )
  end

end