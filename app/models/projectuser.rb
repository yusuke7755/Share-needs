class Projectuser < ApplicationRecord
  belongs_to :project
  belongs_to :customeruser
end
