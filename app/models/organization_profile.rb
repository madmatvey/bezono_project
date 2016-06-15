class OrganizationProfile < ActiveRecord::Base
  belongs_to :organization_account
  has_one :accreditation, :dependent => :destroy
  after_initialize :set_default_accreditation, :if => :new_record?
  validates :inn, presence: true, uniqueness: true

  def set_default_accreditation
    self.accreditation ||= Accreditation.create
  end
end
