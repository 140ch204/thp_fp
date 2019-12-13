FactoryBot.define do
  factory :admin do
    organization { FactoryBot.build(:organization) }
    user { FactoryBot.build(:user) }
  end
end
