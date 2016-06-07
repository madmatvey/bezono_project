class OrganizationAccount < ActiveRecord::Base
  validates :name, :presence => true,
                    :length => { :minimum => 3 },
                     uniqueness: true
  has_many :users
  has_many :organization_profiles

end
