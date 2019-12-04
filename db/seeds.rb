# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Country.destroy_all
Country.create(country_name: "France")
puts "1 country created."

Department.destroy_all
department_count = 0
20.times do
	Department.create(
		country_id: "1",
		department_name: Faker::Address.community,
		zip_code: Faker::Address.zip_code,
		region: Faker::Address.state)
	department_count += 1
end
puts "#{department_count} departments created."

City.destroy_all
city_count = 0
30.times do
	City.create(
		department_id: Department.all.sample.id,
		city_name: Faker::Address.city)
	city_count += 1
end
puts "#{city_count} cities created."

User.destroy_all
user_count = 0
10.times do
	User.create(
		city_id: City.all.sample.id,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email,
		password: Faker::Internet.password)
	user_count += 1
end
puts "#{user_count} users created."

Organization.destroy_all
company_count = 0
association_count = 0
10.times do
	Organization.create(
		city_id: City.all.sample.id,
		name: Faker::Company.name,
		description: Faker::Company.catch_phrase,
		category: Faker::Company.type,
		logo_url: Faker::Company.logo,
		siret: Faker::Company.french_siret_number,
		is_association: false,
		is_company: true)
	company_count += 1
end
10.times do
	Organization.create(
		city_id: City.all.sample.id,		
		name: Faker::Company.name,
		description: Faker::Company.catch_phrase,
		category: Faker::Company.type,
		logo_url: "https://assoangels.com/wp-content/uploads/elementor/thumbs/logo-assoangels-300-124-1-1-o4hpxy1esx73pjdbtvjlqvntt8itx1j1w5k3edklq8.png",
		RNA: Faker::Company.french_siret_number,
		is_association: true,
		is_company: false)
	association_count += 1
end
puts "#{company_count} companies created."
puts "#{association_count} associations created."

Admin.destroy_all
organizations = Organization.all
admin_count = 0
organizations.each do |org|
	Admin.create(
		user_id: User.all.sample.id,
		organization_id: org.id)
	admin_count += 1
end
20.times do
	Admin.create(
		user_id: User.all.sample.id,
		organization_id: Organization.all.sample.id)
	admin_count += 1
end
puts "#{admin_count} admins created."

Project.destroy_all
project_count = 0
25.times do
	Project.create(
		city_id: City.all.sample.id,
		organization_id: Organization.all.sample.id,
		name: Faker::Company.buzzword,
		description: Faker::Company.catch_phrase,
		logo_url: Faker::Avatar.image,
		starting_date: Faker::Date.forward(days: 500),
		donation_targeted: rand(100..100000))
	project_count += 1
end
puts "#{project_count} projects created."

Counterpart.destroy_all
counterpart_count = 0
projects = Project.all
projects.each do |project|
	10.times do
		Counterpart.create(
			project_id: project.id,
			name: Faker::Beer.name,
			price: rand(5..10000))
		counterpart_count += 1
	end
end
puts "#{counterpart_count} counterparts created."

Donation.destroy_all
donation_count = 0
100.times do
	Donation.create(
		counterpart_id: Counterpart.all.sample.id,
		organization_id: Organization.all.sample.id,
		project_id: Project.all.sample.id,
		donation_amount: rand(5..10000),
		)
	donation_count += 1
end
puts "#{donation_count} donations created."