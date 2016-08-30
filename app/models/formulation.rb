class Formulation < ActiveRecord::Base
  belongs_to :problem
  belongs_to :formulation
  belongs_to :organization_profile
  validates :content, presence: true
end
