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
