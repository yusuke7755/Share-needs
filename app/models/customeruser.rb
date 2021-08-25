class Customeruser < ApplicationRecord
  has_many :projects
  belongs_to :customer
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true,length: { maximum: 100 },
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
end