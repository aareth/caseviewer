
FactoryGirl.define do
  factory :subject do
    name { Faker::Name.name }
    body { Faker::Lorem.sentence }
  end

end