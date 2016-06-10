class OrganizationProfile < ActiveRecord::Base
  belongs_to :organization_account
  has_one :accreditation
  after_initialize :set_default_accreditation, :if => :new_record?

  def set_default_accreditation
    self.accreditation ||= Accreditation.create
  end
end
