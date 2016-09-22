FactoryGirl.define do
  sequence :demand_description do |n|
    "#{Faker::Lorem.sentence} №#{n}"
  end
  sequence :demand_name do |n|
    "#{Faker::Lorem.word} №#{n}"
  end

  factory :demand do
    name { generate(:demand_name) }
    description { generate(:demand_description) }
    organization_profile
  end
  #
  # trait :with_explanations do
  #   association :explanation, :factory => [:explanation]
  #   after :create do
  #     demand.explanations << FactoryGirl.build_list(:explanation, 2)
  #   end
  #   after :build do
  #     demand.explanations << FactoryGirl.build_list(:explanation, 2)
  #   end
  # end

  # trait :with_explanations_without_answer do
  #   association :explanation, :factory => [:explanation, :without_answer]
  # end
  #
  # trait :with_explanations_with_answer do
  #   association :explanation, :factory => [:explanation, :with_answer]
  # end
end
