class Projectdepartment < ApplicationRecord
  belongs_to :project
  belongs_to :department
end