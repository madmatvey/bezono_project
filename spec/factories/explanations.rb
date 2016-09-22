FactoryGirl.define do
  sequence :message do |n|
    "#{Faker::Lorem.sentence} №#{n}"
  end

  factory :explanation, aliases: [:question, :answer] do
    message { generate(:message) }
    user
    demand
    organization_profile
    question_id nil

    # # trait :with_answer do
    # #   answer_id 1
    # # end
    # trait :with_answer do
    #   create(:explanation, question_id: explanation.id)
    # end
    #
    # trait :without_answer do
    #   answer_id nil
    # end
  end
end
