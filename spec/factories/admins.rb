FactoryBot.define do
  factory :admin do
    organization { FactoryBot.build(:organization) }
  end
end
