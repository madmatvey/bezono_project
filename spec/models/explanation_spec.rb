require 'rails_helper'

RSpec.describe Explanation, type: :model do
  it "is valid with valid attributes" do
    expect(Explanation.new( message: "message",
                            user_id: 1,
                            organization_profile_id: 1,
                            demand_id: 1)).to be_valid
  end
  it "is not valid without a message" do
    expect(Explanation.new( user_id: 1,
                            organization_profile_id: 1,
                            demand_id: 1)).to_not be_valid
  end
  it "is not valid without a user_id" do
    expect(Explanation.new( message: "message",
                            organization_profile_id: 1,
                            demand_id: 1)).to_not be_valid
  end
  it "is not valid without a organization_profile_id" do
    expect(Explanation.new( message: "message",
                            user_id: 1,
                            demand_id: 1)).to_not be_valid
  end
  it "is not valid without a demand_id" do
    expect(Explanation.new( message: "message",
                            user_id: 1,
                            organization_profile_id: 1)).to_not be_valid
  end
end
