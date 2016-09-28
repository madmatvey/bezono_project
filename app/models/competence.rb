class Competence < ApplicationRecord
  has_many :proofs, dependent: :destroy
  has_many :organization_profiles, through: :proofs
  has_and_belongs_to_many :demands
  validates :tag, presence: true, uniqueness: true



end
