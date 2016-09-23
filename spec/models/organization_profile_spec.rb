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

describe OrganizationProfile, '.accreditated' do
  it 'select only accreditated profiles' do
    profile1 = FactoryGirl.create(:organization_profile, :accreditation_expired)
    profile2 = FactoryGirl.create(:organization_profile, :accreditation_supplier)
    profile3 = FactoryGirl.create(:organization_profile, :accreditation_zero)
    profile4 = FactoryGirl.create(:organization_profile, :accreditation_customer)
    profile5 = FactoryGirl.create(:organization_profile, :accreditation_partner)
    expect(OrganizationProfile.accreditated).to match_array([profile2,profile4,profile5])
  end
end

describe OrganizationProfile, '.customers' do
  it 'select only accreditated customers profiles' do
    profile1 = FactoryGirl.create(:organization_profile, :accreditation_expired)
    profile2 = FactoryGirl.create(:organization_profile, :accreditation_customer)
    profile3 = FactoryGirl.create(:organization_profile, :accreditation_zero)
    profile4 = FactoryGirl.create(:organization_profile, :accreditation_customer)
    profile5 = FactoryGirl.create(:organization_profile, :accreditation_partner)
    profile6 = FactoryGirl.create(:organization_profile, :accreditation_supplier)
    expect(OrganizationProfile.customers).to match_array([profile2,profile4])
  end
end
