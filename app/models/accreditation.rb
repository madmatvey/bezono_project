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

  # attr_writer :current_step
  #
  # def current_step
  #   @current_step || steps.first
  # end
  #
  # def steps
  #   %w[first second confirmation]
  # end
  #
  # def next_step
  #   self.current_step = steps[steps.index(current_step)+1]
  # end
  #
  # def previous_step
  #   self.current_step = steps[steps.index(current_step)-1]
  # end
  #
  # def first_step?
  #   current_step == steps.first
  # end
  #
  # def last_step?
  #   current_step == steps.last
  # end
  #
  # def all_valid?
  #   steps.all? do |step|
  #     self.current_step = step
  #     valid?
  #   end
  # end

end
