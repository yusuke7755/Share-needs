class EmployeesController < ApplicationController
  before_action :authenticate_employee!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def new
    @employee = Employee.new
    #@department = Department.all
  end

  def create
    binding.pry
    @employee = Employee.new(employee_params)
    #@chk_employee=Employee.where("email = ?" , @employee.email)
    binding.pry
    # if @chk_employee.email.count= 0
      if @employee.save
        
        redirect_to new_employee_path flash[:notice] = "社員登録しました。"
      else
        redirect_to new_employee_path flash[:notice] = "社員登録に失敗しました。"
      end
    # else
      #  flash[:notice] = "入力した社員メールで社員は登録されています。"
    # end

  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :password, :departments_id, :position , :admin])
  end
  def employee_params
    params.require(:employee).permit( :email, :name, :password, :departments_id, :position , :admin)
  end

end
