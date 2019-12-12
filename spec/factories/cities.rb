FactoryBot.define do
  factory :city do
    city_name { "Toulon"}
    department { FactoryBot.create(:department) }
  end
end
