class OrganizationAccount < ActiveRecord::Base
  validates :name, :presence => true, :length => { :minimum => 3 }
  validates :name, uniqueness: { case_sensitive: false }
  has_many :users
  has_one :organization_profile
end
