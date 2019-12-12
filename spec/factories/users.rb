FactoryBot.define do
  factory :user do
    email { "#{first_name}.#{last_name}@yopmail.com".downcase }
    password { "testouille"}
    first_name { "John" }
    last_name { "Doe" }
    master { false }
    city { FactoryBot.create(:city) }
  end
end
