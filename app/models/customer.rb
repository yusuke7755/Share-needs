class Customer < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 100 }
  validates :tel, presence: true, length: { maximum: 50 }
  has_many :customerusers
  has_many :projects
  has_many :checks
end
