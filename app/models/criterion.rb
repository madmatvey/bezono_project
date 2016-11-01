class Criterion < ApplicationRecord
  has_and_belongs_to_many :demands
  has_and_belongs_to_many :explanations, autosave: true
  belongs_to :master_criterion, class_name: 'Criterion', foreign_key: 'master_criterion_id'
  has_many :sub_criterions, class_name: 'Criterion', foreign_key: 'master_criterion_id'
  validates :name, presence: true, uniqueness: true

  def master?
    self.master_criterion == nil
  end

end
