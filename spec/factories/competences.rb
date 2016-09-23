FactoryGirl.define do
  sequence :competence_tag do |n|
      "#{Faker::Lorem.word} №#{n}"
  end
  factory :competence do
    tag { generate :competence_tag }
  end
end
