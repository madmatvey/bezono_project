require 'rails_helper'

RSpec.describe Explanation, type: :model do
  explanation = FactoryGirl.create(:explanation)


  it "is valid with valid attributes" do
    expect(explanation).to be_valid
  end
  it "is not valid without a message" do
    explanation.message = nil
    expect(explanation).to_not be_valid
  end
  it "is not valid without a user_id" do
    explanation.user_id = nil
    expect(explanation).to_not be_valid
  end
  it "is not valid without a organization_profile_id" do
    explanation.organization_profile_id = nil
    expect(explanation).to_not be_valid
  end
  it "is not valid without a demand_id" do
    explanation.demand_id = nil
    expect(explanation).to_not be_valid
  end
end

describe Explanation, '#account' do
  it 'returns organization account' do
    explanation = FactoryGirl.create(:explanation)
    expect(explanation.account).to be_an_instance_of(OrganizationAccount)
  end
end

# describe Explanation, '#answered?' do
#   it 'returns true if explanation have answer' do
#     explanation = FactoryGirl.create(:explanation)
#     expect(explanation.account).to be_an_instance_of(OrganizationAccount)
#   end
# end
