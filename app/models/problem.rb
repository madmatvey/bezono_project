class Problem < ApplicationRecord
  belongs_to :demand
  belongs_to :organization_profile
  has_many :formulations, :dependent => :destroy

end
