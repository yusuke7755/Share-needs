class Check < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :customer, optional: true
end
