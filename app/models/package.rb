class Package < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  has_many :features
  has_many :projects
end
