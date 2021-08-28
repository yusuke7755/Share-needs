class Customer < ApplicationRecord
  has_many :customerusers
  has_many :projects
  has_many :checks
end
