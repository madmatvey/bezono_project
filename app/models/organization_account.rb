class OrganizationAccount < ApplicationRecord
  validates :name, :presence => true,
                    :length => { :minimum => 3 },
                     uniqueness: true
  has_many :users, :dependent => :destroy
  has_many :organization_profiles, :dependent => :destroy

end
