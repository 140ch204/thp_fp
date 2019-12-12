FactoryBot.define do
  factory :department do
    department_name { 'Var' }
    zip_code { '83000'}
    region { 'PACA' }
    country { FactoryBot.create(:country) }
  end
end
