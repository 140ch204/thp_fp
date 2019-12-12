FactoryBot.define do
  factory :organization, aliases: [:company] do
    name { Faker::Company.name }
    description { Faker::Company.bs }
    category { Faker::Company.buzzword }
    logo_url { Faker::Company.logo }
    siret { Faker::Company.french_siret_number }
    is_company { true }
    city { FactoryBot.build(:city) }

    trait :with_donation do
      after(:build) do |company|
        company.donation << FactoryBot.build(:donation)
      end
    end
  end

  factory :association, parent: :organization do
    RNA { "w123654815" }
    is_association { true }

    trait :with_project do
      after(:build) do |association|
        association.project << FactoryBot.build(:project)
      end
    end
  end
end
