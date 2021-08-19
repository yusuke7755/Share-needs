class Project < ApplicationRecord
  belongs_to :department
  belongs_to :customer
  belongs_to :package
  belongs_to :employee
  has_many :projectmembers
  has_many :projectdepartments
  has_many :projectfeatures
  has_many :projectusers
  has_many :employees, through: :projectmembers
  has_many :departments, through: :projectdepartments
  has_many :features, through: :projectfeatures
  has_many :customerusers, through: :projectusers

  enum priority: { '1': 1, '2': 2, '3': 3 }
end
