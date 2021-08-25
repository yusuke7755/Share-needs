class ApplicationController < ActionController::Base
  # deviseのコントローラを使う前に呼ばれるアクション
  before_action :configure_permitted_parameters, if: :devise_controller?
  #ヘルパーで持つ情報を共有
  include CustomerManagementsHelper

  def after_sign_in_path_for(resource)
    customer_managements_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end
  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :password, :departments_id, :position , :admin])
  end
end
