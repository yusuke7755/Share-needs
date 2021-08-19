class CustomerManagementsController < ApplicationController
  before_action :authenticate_employee!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search_customer
  before_action :set_project, only: %i[edit update show]
  def new
    @project = Project.new
  end

  def index
     @q = Project.ransack(params[:q])
     @projects = @q.result.page(params[:page]).per(5)
    #  @projects = @result.joins( :departments, :employees, :customerusers, :features)
     #binding.pry
     #@department = @projects.first.department
  end

  def search
  end

  def edit
    @project = Project.joins( :departments, :employees, :customerusers, :features).find(params[:id])
    #binding.pry
  end

  def create

    @project =Project.new(project_params)
      # binding.pry
      if @project.save
        redirect_to new_customer_management_path  flash[:notice] = "レポートが登録されました。"
      else
        # binding.pry
        redirect_to new_customer_management_path  flash[:notice] = "レポートの登録が失敗しました。"
      end
  end

  def update
  end

  def show
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