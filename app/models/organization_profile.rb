class OrganizationProfile < ActiveRecord::Base
  belongs_to :organization_account
  has_one :accreditation, :dependent => :destroy
  after_initialize :set_default_accreditation, :if => :new_record?
  has_many :active_users, class_name: "User",
            foreign_key: "active_profile_id",
            dependent: :nullify
  has_many :demands, :dependent => :destroy
  has_many :explanations, :dependent => :destroy
  has_many :proofs, dependent: :destroy
  has_many :competences, through: :proofs

  validates :inn, presence: true, uniqueness: true
  scope :accreditated,  -> { where(accreditated: OrganizationProfile.accreditated) }
  scope :customers, -> {where(customers: true)}


  def set_default_accreditation
    self.accreditation ||= Accreditation.create
  end

  def accreditated?
    if self.accreditation.verified?
      true
    else
      false
    end
  end

  def self.accreditated
    OrganizationProfile.select {|profile| profile.accreditated?}
  end

  def self.customers
    OrganizationProfile.select {|profile| profile.accreditation.customer?}
  end

  def have_competence?(competence)
    proofs.find_by(competence_id: competence.id)
  end

  def set_competence!(competence)
    proofs.create!(competence_id: competence.id)
  end

end
