class Department < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :web_flg, presence: true
  has_many :employees
  has_many :projects
end
