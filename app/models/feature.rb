class Feature < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  belongs_to  :package
  has_many :projects
end
