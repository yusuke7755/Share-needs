class Project < ApplicationRecord
  belongs_to :employee
  belongs_to :customeruser
  belongs_to :feature
  belongs_to :customer
  belongs_to :department
  belongs_to :package
  enum priority: { '1': 1, '2': 2, '3': 3 }

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 400 }
  validates :apoint_at, presence: true

  before_save :ensure_check_date
  before_save :ensure_department_check
  before_save :ensure_customer_check
  before_save :ensure_package_check

  before_update :ensure_check_date
  before_update :ensure_department_check
  before_update :ensure_customer_check
  before_update :ensure_package_check

  # 入力した日付を取得してチェックを行う
  Chkday = DateTime.now
  def ensure_check_date

    chkdate1 = self.apoint_at
    chkdate2 = self.deadline
     

    if self.deadline != nil
      if Chkday.weeks_ago(1) >= chkdate2

        #期日が1週間前以前の時エラーを返す。
        errors.add :base, '期日が1週間前の入力はできません。'
        throw :abort

      elsif chkdate1 > chkdate2
        #面談日付より過去日付の場合、
        errors.add :base, '面談日時が期日より前です。'
        throw :abort

      end

    end

  end

  # 入力した部署と社員の一致
  def ensure_department_check
    getemployee = Employee.select("department_id").where(id: self.employee_id)
    chkdepartmentid1=""
    getemployee.all.each do |dp|
      chkdepartmentid1 = dp.department_id 
    end

    chkdepartmentid2 = self.department_id

    if chkdepartmentid1 != chkdepartmentid2
        errors.add :base, '部署と所属社員を一致させてください'
        throw :abort
    end
  end

  # 入力した会社とユーザーの一致
  def ensure_customer_check
    getcustomer = Customeruser.select("customer_id").where(id: self.customeruser_id)
    chkdcustomerid1 = ""
    getcustomer.all.each do |ct|
      chkdcustomerid1 = ct.customer_id 
    end

    chkcustomerid2 = self.customer_id

    if chkdcustomerid1 != chkcustomerid2
        errors.add :base, '対象の会社と顧客を一致させてください'
        throw :abort
    end
  end

  # システムと機能の一致
  def ensure_package_check
    getfeature = Feature.select("package_id").where(id: self.feature_id)
    chkdpackage1=""
    getfeature.all.each do |ft|
      chkdpackage1 = ft.package_id 
    end

    chkpackage2 = self.package_id

    if chkdpackage1 != chkpackage2
        errors.add :base, 'システムと機能を一致させてください'
        throw :abort
    end
  end

end
