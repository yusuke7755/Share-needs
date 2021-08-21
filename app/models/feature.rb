class Feature < ApplicationRecord
  belongs_to  :package
  has_many :projects
end
