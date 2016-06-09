class Accreditation < ActiveRecord::Base
  belongs_to :organization_profile

  include AASM
  enum state: {
    zero: 0,
    supplier: 1,
    customer: 2,
    partner: 3
  }
  aasm :column => :state, :enum => true do
    state :zero, :initial => true
    event :passed_supplier do
      transitions :from => :zero, :to => :supplier
    end
    event :passed_customer do
      transitions :from => :zero, :to => :customer
    end
    event :passed_partner do
      transitions :from => :zero, :to => :partner
    end
    event :expired_partner do
      transitions :from => :partner, :to => :zero
    end
    event :expired_supplier do
      transitions :from => :supplier, :to => :zero
    end
    event :expired_customer do
      transitions :from => :customer, :to => :zero
    end
  end
end
