class Check < ApplicationRecord
  belongs_to :project
  belongs_to :customer
  belongs_to :employee
end
