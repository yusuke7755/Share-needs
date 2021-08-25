class Project < ApplicationRecord
  belongs_to :employee
  belongs_to :customeruser
  belongs_to :feature
  enum priority: { '1': 1, '2': 2, '3': 3 }

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true,length: { maximum: 400 }
  validates :apoint_at, presence: true
  validates :feature_id, presence: true
  validates :customeruser_id, presence: true
  validates :employee_id, presence: true

  before_save :ensure_set_date


  def ensure_set_date
    binding.pry
    chkdate1 = self.apoint_at
    chkdate2 = self.deadline
    if self.deadline != nil
      if chkdate1 < chkdate2
        errors.add(:apoint_at,"の日付が",:deadline , "の日付よりも先の日付です")
        throw(:abort) 
      end
    end
  end

  def apoint_at_deadline_chk
    binding.pry
    date1 = self.apoint_at
    date2 = self.deadline
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
