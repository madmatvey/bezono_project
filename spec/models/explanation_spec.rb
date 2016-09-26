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

describe Explanation, '.to_react(demand)' do
  it 'returns Array with explanations' do
    demand = FactoryGirl.create(:demand)
    exp1 = FactoryGirl.create(:explanation)
    exp2 = FactoryGirl.create(:explanation)
    demand.explanations << exp1
    demand.explanations << exp2
    result = Explanation.to_react(demand)
    expect(result).to be_an_instance_of(Array)
  end
  it 'returns id in JSON' do
    demand = FactoryGirl.create(:demand)
    exp1 = FactoryGirl.create(:explanation)
    exp2 = FactoryGirl.create(:explanation)
    demand.explanations << exp1
    demand.explanations << exp2
    result = Explanation.to_react(demand)
    expect(result.first["id"]).to be exp1.id
    #{"id"=>8, "message"=>"Tempora error omnis rerum pariatur. №9", "user_id"=>15, "demand_id"=>11, "organization_profile_id"=>95, "question_id"=>nil, "from"=>"zero", "answer_id"=>nil}
  end
  it 'returns message in JSON' do
    demand = FactoryGirl.create(:demand)
    exp1 = FactoryGirl.create(:explanation)
    exp2 = FactoryGirl.create(:explanation)
    demand.explanations << exp1
    demand.explanations << exp2
    result = Explanation.to_react(demand)
    expect(result.first["message"]).to be exp1.message
    #{"id"=>8, "message"=>"Tempora error omnis rerum pariatur. №9", "user_id"=>15, "demand_id"=>11, "organization_profile_id"=>95, "question_id"=>nil, "from"=>"zero", "answer_id"=>nil}
  end
  it 'returns user_id in JSON' do
    demand = FactoryGirl.create(:demand)
    exp1 = FactoryGirl.create(:explanation)
    exp2 = FactoryGirl.create(:explanation)
    demand.explanations << exp1
    demand.explanations << exp2
    result = Explanation.to_react(demand)
    expect(result.first["user_id"]).to be exp1.user_id
    #{"id"=>8, "message"=>"Tempora error omnis rerum pariatur. №9", "user_id"=>15, "demand_id"=>11, "organization_profile_id"=>95, "question_id"=>nil, "from"=>"zero", "answer_id"=>nil}
  end
  it 'returns demand_id in JSON' do
    demand = FactoryGirl.create(:demand)
    exp1 = FactoryGirl.create(:explanation)
    exp2 = FactoryGirl.create(:explanation)
    demand.explanations << exp1
    demand.explanations << exp2
    result = Explanation.to_react(demand)
    expect(result.first["demand_id"]).to be exp1.demand_id
    #"organization_profile_id"=>95, "question_id"=>nil, "from"=>"zero", "answer_id"=>nil}
  end
  it 'returns organization_profile_id in JSON' do
    demand = FactoryGirl.create(:demand)
    exp1 = FactoryGirl.create(:explanation)
    exp2 = FactoryGirl.create(:explanation)
    demand.explanations << exp1
    demand.explanations << exp2
    result = Explanation.to_react(demand)
    expect(result.first["organization_profile_id"]).to be exp1.organization_profile_id
    #"organization_profile_id"=>95, "question_id"=>nil, "from"=>"zero", "answer_id"=>nil}
  end
  it 'returns question_id in JSON' do
    demand = FactoryGirl.create(:demand)
    exp1 = FactoryGirl.create(:explanation)
    exp2 = FactoryGirl.create(:explanation)
    demand.explanations << exp1
    demand.explanations << exp2
    result = Explanation.to_react(demand)
    expect(result.first["question_id"]).to be exp1.question_id
    # "from"=>"zero", "answer_id"=>nil}
  end
  # it 'returns "from" in JSON' do
  #   demand = FactoryGirl.create(:demand)
  #   exp1 = FactoryGirl.create(:explanation)
  #   exp2 = FactoryGirl.create(:explanation)
  #   demand.explanations << exp1
  #   demand.explanations << exp2
  #   result = Explanation.to_react(demand)
  #   expect(result.first["from"]).to be exp1.from
  #   # "from"=>"zero", "answer_id"=>nil}
  # end
  # it 'returns "answer_id" in JSON' do
  #   demand = FactoryGirl.create(:demand)
  #   exp1 = FactoryGirl.create(:explanation)
  #   exp2 = FactoryGirl.create(:explanation)
  #   demand.explanations << exp1
  #   demand.explanations << exp2
  #   result = Explanation.to_react(demand)
  #   expect(result.first["answer_id"]).to be exp1.answer_id
  #
  # end
end
