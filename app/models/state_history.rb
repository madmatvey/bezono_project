class StateHistory < ActiveRecord::Base
  belongs_to :stateable, polymorphic: true
end
