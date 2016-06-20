class Demand < ActiveRecord::Base
  belongs_to :organization_profile
  has_many :explanations, :dependent => :destroy
  accepts_nested_attributes_for :explanations
end
