class Problem < ActiveRecord::Base
  belongs_to :demand
  belongs_to :organization_profile
end
