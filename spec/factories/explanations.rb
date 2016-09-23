FactoryGirl.define do
  sequence :message do |n|
    "#{Faker::Lorem.sentence} №#{n}"
  end

  factory :explanation, aliases: [:question, :answer] do
    message { generate(:message) }
    user
    demand
    organization_profile

    trait :with_answer do
      association :answer, factory: :answer
    end
    # trait :with_answer do
    #   create(:explanation, question_id: explanation.id)
    # end
    #
    # trait :without_answer do
    #   answer_id nil
    # end

    trait :with_referrer do
      association :referrer, factory: :user
    end
  end
end
