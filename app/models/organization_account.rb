class OrganizationAccount < ActiveRecord::Base
  validates :name, :presence => true,
                    :length => { :minimum => 3 }
  has_many :users
  has_many :organization_profile



end
