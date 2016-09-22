describe User do

  before(:each) { @user = User.new(email: 'user@example.com') }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

end

describe User, '#profiles' do
  # it 'returns empty array if 0 profiles' do
  #   user = FactoryGirl.create(:user)
  #   expect(user.profiles).to be_kind_of(Array)
  # end
  it 'returns array of profiles' do
    user = FactoryGirl.create(:user)
    expect(user.profiles[0]).to be_an_instance_of(OrganizationProfile)
  end
end

describe User, '#supplier?' do
  it 'returns TRUE if user organization accreditation is supplier' do
    user = FactoryGirl.create(:user)
    profile = user.organization_account.organization_profiles.first
    user.active_profile_id = profile.id
    user.active_profile.accreditation.accept_as_supplier
    expect(user.supplier?).to be_truthy
  end
  it 'returns FALSE if user organization accreditation is not supplier' do
    user = FactoryGirl.create(:user)
    profile = user.organization_account.organization_profiles.first
    user.active_profile_id = profile.id
    user.active_profile.set_default_accreditation
    expect(user.supplier?).to be_falsey
  end

end

describe User, '#customer?' do
  it 'returns TRUE if user organization accreditation is customer' do
    user = FactoryGirl.create(:user)
    profile = user.organization_account.organization_profiles.first
    user.active_profile_id = profile.id
    user.active_profile.accreditation.accept_as_customer
    expect(user.customer?).to be_truthy
  end
  it 'returns FALSE if user organization accreditation is not customer' do
    user = FactoryGirl.create(:user)
    profile = user.organization_account.organization_profiles.first
    user.active_profile_id = profile.id
    user.active_profile.set_default_accreditation
    expect(user.customer?).to be_falsey
  end
end
