class Feature < ApplicationRecord
  has_many :projectfeatures
  has_many :project, through: :projectfeatures
  belongs_to  :package
  
end
