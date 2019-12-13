FactoryBot.define do
  factory :project do
    organization { FactoryBot.build(:organization) }
    name { Faker::Superhero.name }
    description { Faker::Superhero.descriptor }
    logo_url { Faker::Company.logo}
    starting_date { @date = Faker::Date.forward(days: 20) }
    donation_targeted { rand(1000..20_000) }
    donation_start { date = Faker::Date.forward(days: 20) }
    donation_end { @date.advance(days: 30) }
    city { FactoryBot.build(:city) }
  end
end