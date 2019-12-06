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
		country_id: Country.all.sample.id,
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
my_master = 0
my_admin_asso = 0
my_admin_firm = 0
10.times do
  case user_count
  when 0 # Master 
    master = true
  else
    master = false
  end

	my_user = User.create(
		city_id: City.all.sample.id,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: (Faker::Name.first_name + "." + Faker::Name.last_name + "@yopmail.com"),
    password: "aaaaaa",
    master: master)
    
  (user_count == 0)? (my_master = my_user) : ""
  (user_count == 1)? (my_admin_asso = my_user) : ""
  (user_count == 2)? (my_admin_firm = my_user) : ""
  user_count += 1
  
end
puts "#{user_count} users created."
puts "master | email : #{my_master.email} | pwd = aaaaaa | id = #{my_master.id}"
puts "admin asso | email : #{my_admin_asso.email} | pwd = aaaaaa | id = #{my_admin_asso.id}"
puts "admin firm | email : #{my_admin_firm.email} | pwd = aaaaaa | id = #{my_admin_firm.id}"


Organization.destroy_all
company_count = 0
association_count = 0
10.times do
	one_company = Organization.create(
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
	one_asso = Organization.create(
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

Like.destroy_all
like_count = 0
10.times do
	Like.create(
		is_liking: true,
		user_id: User.all.sample.id,
		project_id: Project.all.sample.id
		)
	like_count += 1
end
puts "#{like_count} likes created."

Follow.destroy_all
follow_count = 0
10.times do
	Follow.create(
		is_following: true,
		user_id: User.all.sample.id,
		organization_id: Organization.all.sample.id
		)
	follow_count += 1
end
puts "#{follow_count} follows created."

buzzword = ["environnement", "sociétal", "jeunesse", "troisième âge", "parc", "nature", "éducation"]
Tag.destroy_all
buzzword.length.times do |n|
	Tag.create(tag_name: buzzword[n])
end
puts "#{buzzword.length} tags created."

TagList.destroy_all
tag_count = 0
20.times do
	TagList.create(
		tag_id: Tag.all.sample.id,
		organization_id: Organization.all.sample.id
		)
	tag_count += 1
end
puts "#{tag_count} tag_lists created."