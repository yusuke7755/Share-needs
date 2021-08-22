class Employee < ApplicationRecord
  belongs_to  :department
  has_many :projects
  has_many :checks
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true,length: { maximum: 50 },
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  before_validation { email.downcase! }
  enum position: {部長: 1 , 課長: 2, 主任:3, 一般: 4 }
end
