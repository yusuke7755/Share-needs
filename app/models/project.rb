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
  validates :feature_id, presence: true
  validates :customeruser_id, presence: true
  validates :employee_id, presence: true

  validates :customer_id, presence: true
  validates :department_id, presence: true
  validates :package_id, presence: true

  before_save :ensure_check_date

  # 入力した日付を取得してチェックを行う
  def ensure_check_date
    binding.pry
    chkdate1 = self.apoint_at
    chkdate2 = self.deadline
    if self.deadline != nil
      if chkdate1 > chkdate2
        errors.add :base, '面談日時が期日より前です。'
        throw :abort
      end
    end
  end


  # #リストボックスを作成
  # #部署情報
  # departments= Department.where(web_flg: true).all
  # department_names = departments.map(&:name)
  # department_enum_hash = {}
  # department_names.each_with_index do |name, i|
  # department_enum_hash.store(name, i)
  # end
  # enum enum_departments: department_enum_hash

  # #顧客情報
  # customers = Customer.all
  # customer_names = customers.map(&:name)
  # customer_enum_hash = {}
  # customer_names.each_with_index do |name, i|
  # customer_enum_hash.store(name, i)
  # end
  # enum enum_customers: customer_enum_hash

  # #システム情報
  # packages = Package.all
  # package_names = packages.map(&:name)
  # package_enum_hash = {}
  # package_names.each_with_index do |name, i|
  # package_enum_hash.store(name, i)
  # end
  # enum enum_packages: package_enum_hash
end
