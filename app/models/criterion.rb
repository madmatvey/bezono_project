class Criterion < ActiveRecord::Base
  belongs_to :demand
  belongs_to :master_criterion, class_name: 'Criterion', foreign_key: 'master_criterion_id'
  has_many :sub_criterions, class_name: 'Criterion', foreign_key: 'master_criterion_id'

end
