require 'rails_helper'

describe Accreditation, '#state= value' do
  it 'set state from digit' do
    accreditation = FactoryGirl.create(:accreditation)
    accreditation.state = 1
    expect(accreditation.state).to eq "supplier"
  end
  it 'set state from string' do
    accreditation = FactoryGirl.create(:accreditation)
    accreditation.state = "supplier"
    expect(accreditation.state).to eq "supplier"
  end
end

describe Accreditation, '.verified' do
  it 'select only verified from all' do
    accreditation1 = FactoryGirl.create(:accreditation,:supplier)
    accreditation2 = FactoryGirl.create(:accreditation,:customer)
    accreditation3 = FactoryGirl.create(:accreditation,:partner)
    accreditation4 = FactoryGirl.create(:accreditation,:zero)
    accreditation5 = FactoryGirl.create(:accreditation,:expired)
    expect(Accreditation.verified).to match_array([accreditation1,accreditation2,accreditation3])
  end
end
