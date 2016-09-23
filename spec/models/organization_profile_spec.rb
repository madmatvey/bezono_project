require 'rails_helper'

describe OrganizationProfile, '#accreditated?' do
  it 'OK for supplier' do
    profile = FactoryGirl.create(:organization_profile, :accreditation_supplier)
    expect(profile.accreditated?).to be_truthy
  end
  it 'OK for customer' do
    profile = FactoryGirl.create(:organization_profile, :accreditation_customer)
    expect(profile.accreditated?).to be_truthy
  end
  it 'OK for partner' do
    profile = FactoryGirl.create(:organization_profile, :accreditation_partner)
    expect(profile.accreditated?).to be_truthy
  end
  it 'not OK for zero' do
    profile = FactoryGirl.create(:organization_profile, :accreditation_zero)
    expect(profile.accreditated?).to be_falsey
  end
  it 'not OK for expired' do
    profile = FactoryGirl.create(:organization_profile, :accreditation_expired)
    expect(profile.accreditated?).to be_falsey
  end
end
