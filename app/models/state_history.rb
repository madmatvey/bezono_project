class StateHistory < ApplicationRecord
  belongs_to :stateable, polymorphic: true
end
