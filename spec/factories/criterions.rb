FactoryGirl.define do
  sequence :criterion_name do |n|
      "#{Faker::Lorem.word} №#{n}"
  end
  factory :criterion do
    name { generate :criterion_name }
  end
end
