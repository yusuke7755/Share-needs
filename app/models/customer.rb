class Customer < ApplicationRecord
  has_many :projects
  has_many :customerusers
end
