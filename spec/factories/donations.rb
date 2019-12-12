FactoryBot.define do
  factory :donation do
    organization { FactoryBot.build(:company) }
    project { FactoryBot.build(:project) }
    donation_amount { rand(10..10_000) }
  end
end
