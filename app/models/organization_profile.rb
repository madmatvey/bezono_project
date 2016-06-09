class OrganizationProfile < ActiveRecord::Base
  belongs_to :organization_account
  has_one :accreditation
end
