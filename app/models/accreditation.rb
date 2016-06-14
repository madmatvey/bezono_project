class Accreditation < ActiveRecord::Base

  belongs_to :organization_profile
  # accepts_nested_attributes_for :organization_profile

  include AASM

  enum state: {
    zero: 0,
    expired: 666,
    supplier: 1,
    customer: 2,
    partner: 3
  }

  aasm :column => :state, :enum => true do
    has_history
    state :zero, :initial => true
    state :supplier
    state :customer
    state :partner
    state :expired

    event :accept_as_supplier do
      transitions :from => [:zero, :expired], :to => :supplier
    end
    event :accept_as_customer do
      transitions :from => [:zero, :expired], :to => :customer
    end
    event :accept_as_partner do
      transitions :from => [:zero, :expired], :to => :partner
    end
    event :expires do
      transitions :from => [:partner,:supplier,:customer], :to => :expired
    end
  end

  has_state_history

  def state= value
    if value.kind_of?(String) and value.to_i.to_s == value
      super value.to_i
    else
      super value
    end
  end


end
