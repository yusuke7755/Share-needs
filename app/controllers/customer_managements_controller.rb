class CustomerManagementsController < ApplicationController
  before_action :authenticate_employee! , except: %i[top]
  before_action :set_project, only: %i[edit update show destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    @project = Project.new
    @department = Department.where(web_flg: true)
    @customer = Customer.all
    @customeruser = Customeruser.all
    @package = Package.all
    @feature = Feature.all
    @employee = Employee.all

  end

  def department_employee
    # employeeをdepartment_idで絞り込んで取得する。
    @employee = Employee.where(department_id: params[:project][:department_id])
    @include_blank_message = @employee.count > 0 ? false : "部署を選択してください"
  end

  def customer_customeruser
    # customeruserをcustomer_idで絞り込んで取得する。
    @customeruser = Customeruser.where(customer_id: params[:project][:customer_id])
    @include_blank_message = @customeruser.count > 0 ? false : "会社を選択してください"
  end

  def package_feature
    # featureをpackage_idで絞り込んで取得する。
    @feature = Feature.where(package_id: params[:project][:package_id])
    @include_blank_message = @feature.count > 0 ? false : "システムを選択してください"
  end


  def index
    @department = Department.where(web_flg: true)
    @customer = Customer.all
    @projects = Project.all
    @q = @projects.ransack(params[:q])

    if params[:sort_checked].present?

      @check = Check.where(employee_id: current_employee.id)

      if @check.count > 0

        #親データから子データを絞り込み
        @customer = []
        @check.all.each do |ck|
        @customer << ck.customer_id
        end

        @projects = Project.where(customer_id: @customer)
        @projects = @projects.order(apoint_at: :DESC).page(params[:page]).per(5)

      else

        flash[:notice] = "状況管理しているものはありません。"
        @projects = @q.result.order(apoint_at: :DESC).page(params[:page]).per(5)

      end

    elsif params[:search].present?
        # あいまい検索
        @projects = Project.all
        @projects = @projects.where(department_id: params[:search][:department_id]) if params[:search][:department_id].present?
        @projects = @projects.where(customer_id: params[:search][:customer_id])if params[:search][:customer_id].present?
        @projects = @projects.order(apoint_at: :DESC).page(params[:page]).per(5)

    else

      @projects = @q.result.order(apoint_at: :DESC).page(params[:page]).per(5)

    end

  end

  def show
    project = Project.find(params[:id])
    @check = current_employee.checks.find_by(customer_id: project.customer_id)
  end

  def top
  end

  def edit
    @project = Project.find(params[:id])
    @department = Department.where(web_flg: true)
    @customer = Customer.where(id:  @project.customer_id)
    @package = Package.where(id:  @project.package_id)
  end

  def destroy
    @project.destroy
    redirect_to customer_managements_path flash[:notice] = "作成したレポートが削除されました。"
  end

  def update
    if @project.update(project_params)
      redirect_to customer_managements_path  flash[:notice] = "レポートが編集されました。"
    else
      # notice: "レポートの編集が失敗しました。"
      render :edit
    end

  end

  def create
    @department = Department.where(web_flg: true)
    @project =Project.new(project_params)
      if @project.save
        redirect_to customer_managements_path flash[:notice] ="レポートが作成されました。"
      else
        # notice: "レポートの作成が失敗しました。"
        render :new
      end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :employee_id, :department_id, :customer_id, :customeruser_id, :package_id, :feature_id, :description, :apoint_at, :priority, :deadline  )
  end

  protected

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :password, :department_id, :position , :admin])
  end

end
