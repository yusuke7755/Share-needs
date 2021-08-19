class Package < ApplicationRecord
  has_many    :features
  has_many     :projects
end
