class Department < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :web_flg, inclusion: {in: [true, false]}
  has_many :employees
  has_many :projects
  has_ancestry
end
