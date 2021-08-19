class Customeruser < ApplicationRecord
  has_many :projectusers
  has_many :project, through: :projectusers
  belongs_to :customer
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true,length: { maximum: 50 },
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
end