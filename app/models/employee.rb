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

  def self.guest
    find_or_create_by!(email: 'guestuser@email.com') do |guest|
      guest.name = 'ゲストユーザー'
      guest.password = 'password'
      guest.password_confirmation = 'password'
      guest.admin = false
      guest.department_id = 6
    end
  end

  def self.admin_guest
    find_or_create_by!(email: 'guestadmin@email.com') do |admin|
      admin.name = 'ゲスト管理者'
      admin.password = 'password'
      admin.password_confirmation = 'password'
      admin.admin = true
      admin.department_id = 6
    end
  end

end
