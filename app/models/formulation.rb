class Formulation < ActiveRecord::Base
  belongs_to :problem
  belongs_to :formulation
  validates :content, presence: true
end
