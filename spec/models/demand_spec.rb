require 'rails_helper'

describe Demand, '#have_explanations_without_answer?' do
  it 'returns TRUE if yes' do
    demand = FactoryGirl.create(:demand)
    exp1 = FactoryGirl.create(:explanation)
    exp2 = FactoryGirl.create(:explanation)
    demand.explanations << exp1
    demand.explanations << exp2
    # demand.explorations[1].question_id = demand.explorations[0].id

    expect(demand.have_explanations_without_answer?).to be_truthy
  end
  it 'returns FALSE if not' do
    demand = FactoryGirl.create(:demand)
    exp1 = FactoryGirl.create(:explanation)
    exp2 = FactoryGirl.create(:explanation)
    exp2.question_id = exp1.id
    demand.explanations << exp1
    demand.explanations << exp2

    expect(demand.have_explanations_without_answer?).to be_falsey
  end
end


describe Demand, '#count_of_explanations_without_answers' do
  it 'returns count' do
    demand = FactoryGirl.create(:demand)
    exp1 = FactoryGirl.create(:explanation)
    exp2 = FactoryGirl.create(:explanation)
    demand.explanations << exp1
    demand.explanations << exp2
    expect(demand.count_of_explanations_without_answers).to eq 2
  end
end
