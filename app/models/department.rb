class Department < ApplicationRecord
  has_many :projects
  has_many :employees
  has_many :projectdepartments
  has_many :project , through: :projectdepartments
end
