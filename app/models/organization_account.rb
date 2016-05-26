class OrganizationAccount < ActiveRecord::Base
  validates :name, :presence => true,
                    :length => { :minimum => 3 }
  has_many :users




end
