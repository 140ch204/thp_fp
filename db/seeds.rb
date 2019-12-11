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

department_array= [{'department_name'=>'Seine-et-Marne','zip_code'=>'77','region'=>'Ile-de-France'},{'department_name'=>'Yvelines','zip_code'=>'78','region'=>'Ile-de-France'},{'department_name'=>'Essonne','zip_code'=>'91','region'=>'Ile-de-France'},{'department_name'=>'Hauts-de-Seine','zip_code'=>'92','region'=>'Ile-de-France'},{'department_name'=>'Seine-Saint-Denis','zip_code'=>'93','region'=>'Ile-de-France'},{'department_name'=>'Val-de-Marne','zip_code'=>'94','region'=>'Ile-de-France'},{'department_name'=>'Val-d Oise','zip_code'=>'95','region'=>'Ile-de-France'}]

department_count = 0
department_array.each do |department|
  Department.create(
    country_id: Country.all.sample.id,
    department_name: department['department_name'],
    zip_code: department['zip_code'],
    region: department['region'])
  department_count += 1
end
puts "#{department_count} departments created."


#department_count = 0
#20.times do
#	Department.create(
#		country_id: Country.all.sample.id,
#		department_name: Faker::Address.community,
#		zip_code: Faker::Address.zip_code,
#		region: Faker::Address.state)
#	department_count += 1
#end
#puts "#{department_count} departments created."


city_array= [{'city_name'=>'Paris'},{'city_name'=>'Boulogne-Billancourt'},{'city_name'=>'Saint-Denis '},{'city_name'=>'Argenteuil '},{'city_name'=>'Montreuil '},{'city_name'=>'Nanterre '},{'city_name'=>'Vitry-sur-Seine'},{'city_name'=>'Créteil'},{'city_name'=>'Asnières-sur-Seine'},{'city_name'=>'Versailles'},{'city_name'=>'Colombes'},{'city_name'=>'Aubervilliers'},{'city_name'=>'Aulnay-sous-Bois '},{'city_name'=>'Courbevoie '},{'city_name'=>'Rueil-Malmaison '},{'city_name'=>'Champigny-sur-Marne '},{'city_name'=>'Saint-Maur-des-Fossés '},{'city_name'=>'Drancy '},{'city_name'=>'Issy-les-Moulineaux'},{'city_name'=>'Noisy-le-Grand'},{'city_name'=>'Levallois-Perret'},{'city_name'=>'Cergy '},{'city_name'=>'Antony '},{'city_name'=>'Neuilly-sur-Seine '},{'city_name'=>'Clichy '},{'city_name'=>'Ivry-sur-Seine '},{'city_name'=>'Sarcelles '},{'city_name'=>'Villejuif'},{'city_name'=>'Le Blanc-Mesnil'},{'city_name'=>'Pantin '},{'city_name'=>'Maisons-Alfort '},{'city_name'=>'Épinay-sur-Seine '},{'city_name'=>'Évry-Courcouronnes'},{'city_name'=>'Chelles '},{'city_name'=>'Meaux '},{'city_name'=>'Fontenay-sous-Bois '},{'city_name'=>'Bondy'},{'city_name'=>'Clamart '},{'city_name'=>'Sartrouville'},{'city_name'=>'Bobigny '}]

City.destroy_all
city_count = 0
city_array.each do |city|
  City.create(
    department_id: Department.all.sample.id,
    city_name: city['city_name'])
  city_count += 1
end
puts "#{city_count} cities created."

#City.destroy_all
#city_count = 0
#30.times do
#	City.create(
#		department_id: Department.all.sample.id,
#		city_name: Faker::Address.city)
#	city_count += 1
#end
#puts "#{city_count} cities created."

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
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  my_user = User.create(
    city_id: City.all.sample.id,
    first_name: first_name,
    last_name: last_name,
    email: (first_name + "." + last_name + "@yopmail.com"),
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



company_array= [{'name'=>'ABC CONSEIL','description'=>'accessibilité en diagnostic et en mise en application
  maîtrise d oeuvre d exécution ( travail en partenariat avec un architecte)','category'=>'BTP','logo_url'=>'https://r2v.eu/wp-content/uploads/cache/images/logoabcconseil/logoabcconseil-210385576.png','is_company'=>'ent'},{'name'=>'AGIR','description'=>'Administratif, Audit   Gestion, Ressources Humaines
  Assistanat - Gestion','category'=>'Administratif','logo_url'=>'http://www.mairie-athis-mons.fr/annuaire/logo_association_175.jpg','is_company'=>'ent'},{'name'=>'DPG Solutions','description'=>'DPG Solutions accompagne et forme les dirigeants de TPE et PME à taille humaine dans le pilotage quotidien de leur entreprise.
  Nous intervenons dans les domaines suivants :
  • Gestion administrative : Organisation administrative, établissement et contrôle de documents commerciaux, optimisation des charges…
  • Contrôle de gestion : Tableau de bord de trésorerie, analyse des performances, aide à la prise de décision…
  • Gestion sociale : Collecte des données de paie, assistance aux entretiens annuels…
  La digitalisation est au cœur de ces trois domaines.
  DPG Solutions conseil aussi les porteurs de projet dans la création de leur entreprise (Business plan, financement, immatriculation).','category'=>'Conseil','logo_url'=>'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Dpg-media-Logo.svg/1200px-Dpg-media-Logo.svg.png','is_company'=>'ent'},{'name'=>'EVOLUPERF','description'=>'Spécialisé dans l accompagnement par le coaching de tous collaborateurs d entreprises.
  Coach professionnel certifié RNCP et Formateur depuis plus de 15 ans.
  Intervenant à la Haute Ecole de Coaching en tant que formateur auprès des futurs coachs professionnels dans l  accompagnement des managers et dirigeants.
  
  Le coach vous accompagne dans l’atteinte de votre objectif et le formateur vous apporte ou développe les éventuelles compétences nécessaires à cette réussite (management, prise de parole en public, réussir dans son changement de poste…).','category'=>'Conseil','logo_url'=>'http://www.evoluperf.fr/img/logo.png','is_company'=>'ent'},{'name'=>'MACARONS GOURMANDS','description'=>'Conception - fabrication et distribution de macarons - Vente en sous traitance','category'=>'Fabricant','logo_url'=>'https://www.fondation-patrimoine.org/uploads/sponsor/59e860ebce8ad_logo-macarons-gourmands-paris-jpg.jpeg','is_company'=>'ent'},{'name'=>'ASETI','description'=>'Vous recherchez une solution ponctuelle ou régulière pour vous soulager de votre administratif et gagner du temps…
  A.S.E.T.I., entreprise spécialisée dans l’assistance administrative et la gestion commerciale vous propose des prestations flexibles adaptées à vos besoins.','category'=>'Administratif','logo_url'=>'http://asetisolutions.com/wp-content/uploads/2016/02/fer-logo-300x232.png','is_company'=>'ent'},{'name'=>'Gphoris','description'=>'Gphoris assure le dépannage de votre matériel informatique, de vos logiciels, de l installation, et de la configuration.
  Gphoris assure aussi une assistance à l utilisation de vos outils informatique ainsi que du conseil.
  Développement d outil d aide à la production.','category'=>'Informatique ','logo_url'=>'https://img.discogs.com/HGYuk7oK8vwGQNM8Gpr_RTEdbbA=/300x300/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/L-103561-1248629957.jpeg.jpg','is_company'=>'ent'},{'name'=>'S2iB','description'=>'Clientèle de syndics et de particuliers sur Paris et IDF Sud.','category'=>'BTP','logo_url'=>'http://www.poussieresdetoiles.net/wp-content/uploads/2016/06/S2iB_2.jpg','is_company'=>'ent'},{'name'=>'Interior Design & Immobilier','description'=>'Interior Design & Immobilier est votre spécialiste pour tous vos projets liés à votre Habitat ou vos locaux professionnel.
  
  Architecte Intérieur   Conseillé Immobilier   Designer de mobilier sur mesure.','category'=>'BTP','logo_url'=>'https://www.ouestfrance-immo.com/photo-eurl-ethique-immobilier/client/13346/eurl-ethique-immobilier-13346_cli_logo.jpg','is_company'=>'ent'},{'name'=>'MR CONSEIL','description'=>'Informatique   Technologies
  Services informatiques de proximité pour particuliers et TPE - vente de matériels et logiciels','category'=>'Informatique   ','logo_url'=>'https://bin.staticlocal.ch/localplace-images/cc/cc2b864322911a6090c145712478607966e000bb/MR%20CONSEIL2.jpg','is_company'=>'ent'},{'name'=>'ALTICLIC','description'=>'AltiClic propose des reportages photos et vidéos pour les entreprises et les collectivités, avec la particularité de pouvoir mêler photos traditionnelles et photos aériennes, ces dernières étant réalisées par mât télescopique, par ballon captif, par drone ou par hélicoptère.','category'=>'Communication','logo_url'=>'https://www.asso-puzzle.org/wp-content/uploads/2018/04/logo_alticlic.jpg','is_company'=>'ent'},{'name'=>'CROIX ROUGE FRANCAISE','description'=>'La Croix-Rouge française est une association d aide humanitaire française fondée en 1864. Elle a pour objectif de venir en aide aux personnes en difficulté en France et à l étranger. Ses missions fondamentales sont l urgence, le secourisme, l action sociale, la formation, la santé et l action internationale.','category'=>'Action sociale sans hébergement','logo_url'=>'https://www.croix-rouge.fr/design/crf_refonte/images/logo.png','is_company'=>'asso'},{'name'=>'Rock en seine','description'=>'Rock en Seine est un festival qui a lieu dans le parc de Saint-Cloud aux portes de Paris, au cœur de jardins historiques dessinés par Le Nôtre','category'=>'Musique','logo_url'=>'https://pbs.twimg.com/profile_images/1109107012292542464/Kb33pGZf.png','is_company'=>'asso'},{'name'=>'FÉDÉRATION FRANÇAISE DE JUDO','description'=>'FÉDÉRATION FRANÇAISE DE JUDO','category'=>'Sport','logo_url'=>'https://www.ffjudo.com/assets/images/logo.png','is_company'=>'asso'},{'name'=>'Médecins sans frontières','description'=>'La Fédération française de judo, jujitsu, kendo et disciplines associées est l association sportive qui a pour but de promouvoir la pratique du judo et des bouffer les disciplines associées composées du jujitsu, kendo, iaïdo, sport chanbara, jōdō, naginata, kyūdō, sumo et taïso.','category'=>'Santé','logo_url'=>'https://www.msf.fr/themes/custom/msf/logo.svg','is_company'=>'asso'},{'name'=>'Association ENAC','description'=>'Créée en 1994, l association à but non lucratif ENAC organise des cours collectifs et individuels de musique, théâtre, dessin peinture, cinéma, photo, langues étrangères et expression corporelle.
  
  L objectif de cet enseignement destiné aux enfants, adolescents, et adultes de tous âges et de tous niveaux, est de contribuer à leur expression créative, leur confiance en eux-mêmes et leur épanouissement afin de mieux réussir leur scolarité, leurs études, leur vie personnelle, professionnelle et post-professionnelle.
  
  Les cours, ateliers et stages fonctionnent entre septembre et juin, dans le quartier Gaité-Pernéty, près de la gare Montparnasse, dans des salles municipales et au local Enac (104 rue du Château 75014). Des formations peuvent également être organisées en entreprises.
  
  ENAC est agréée par le Ministère de la Jeunesse et des Sports comme organisme de Loisirs et d Education Populaire. Elle organise également chaque année une vingtaine d ateliers de danse dans des écoles primaires de la Ville de Paris.
  
  ENAC organise des événements tout au long de l année (expositions d arts graphiques et plastiques, de photographie, projections de films, auditions musicales, spectacles de théâtre et de comédie musicale). Les adhérents sont invités à y participer et à retrouver leurs images et ou celles de leurs enfants en vitrine du local Enac, sur le matériel de communication, sur le site et les pages facebook, instagram et youtube. Tout refus explicite est respecté par l association.
  
  ​
  
  L association ENAD a été créée en 2006 pour organiser des cours particuliers à domicile dans le XIVème arrdt et les quartiers adjacents, en matière de pratique instrumentale et de langues. Elle est agréée pour faire bénéficier ses adhérents de la défiscalisation qui permet de déduire de l impôt sur le revenu la moitié des sommes qui lui sont versées.
  
  ENAD organise des auditions musicales en fin d année. Les adhérents sont invités à y participer et à retrouver leurs images et ou celles de leurs enfants en vitrine du local Enac Enad, sur le matériel de communication, sur le site et les pages facebook, instagram et youtube. Tout refus explicite est respecté par l association.','category'=>'Théatre','logo_url'=>'https://static.wixstatic.com/media/c9ed3e_49571147aa604539b6b618e6dfb74237~mv2.png/v1/fill/w_227,h_82,al_c,q_80,usm_0.66_1.00_0.01/logo_enac__.webp','is_company'=>'asso'},{'name'=>'Reseau entreprendre','description'=>'Nés de la volonté d’un même homme André Mulliez, Réseau Entreprendre et la Fondation Entreprendre s’unissent pour promouvoir l’entrepreneuriat comme l’une des réponses à la création d’emplois et de valeurs.
  
  Depuis sa création, la Fondation Entreprendre accompagne l’ambition nationale de Réseau Entreprendre – accompagner tous ceux qui portent un projet entrepreneurial créateur d’emplois – et soutient également les actions à destination des jeunes pour transmettre l’envie d’entreprendre.
  
  Pour participer à la création d’emplois sur votre territoire, les associations Réseau Entreprendre ont besoin de votre contribution ! Nous avons tous un rôle à jouer pour que les entreprises créatrices de richesse et d’emplois se développent et que les jeunes s’ouvrent à la culture d’entreprise. Plus que créer des emplois, votre don crée de la valeur !
  
  Merci pour votre don.','category'=>'Entreprenariat','logo_url'=>'https://www.reseau-entreprendre.org/wp-content/uploads/2017/04/logo-header.png','is_company'=>'asso'},{'name'=>'AFM Téléthon','description'=>'Innover pour guérir : le combat des malades et de leurs familles
  L’AFM-Téléthon est une association de parents et de malades qui mène un combat sans relâche contre des maladies génétiques, rares et lourdement invalidantes.','category'=>'Santé','logo_url'=>'https://www.afm-telethon.fr/sites/all/themes/custom/afm/logo.png','is_company'=>'asso'},{'name'=>'Bretigny rugby','description'=>'Les amis du rugby regroupent l’ensemble des bénévoles qui assurent la gestion du Club House (gestion de la buvette les jours de matchs, approvisionnement, entretien…).
  
  Les amis du rugby organisent aussi différentes manifestations tout au long de l’année au sein du club (loto, soirée à thème…) ou participent à certaines manifestations organisées par la commune (carnaval de Brétigny, puces).
  
  Les bénéfices ainsi dégagés permettent de financer les goûters et sorties de l’École de Rugby ainsi que les collations d’avant ou d’après match pour toutes les catégories.','category'=>'Sport','logo_url'=>'http://bretignyrugby.fr/rcsb/wp-content/uploads/2014/08/Logo_RCSB_245x156.png','is_company'=>'asso'},{'name'=>'Resto du cœur','description'=>'S’engager aux côtés des Restos c’est permettre à l’association de continuer à bénéficier de soutien tout au long de l’année pour assurer ses missions sociales d’aide à la personne.
  
  Aujourd’hui plus que jamais, la recherche de ressources complémentaires est devenue une priorité.','category'=>'Solidarité','logo_url'=>'https://www.restosducoeur.org/wp-content/uploads/2016/04/logo.svg','is_company'=>'asso'},{'name'=>'Necker enfant malades','description'=>'Apprendre, rire, jouer, lire : les associations rendent la vie plus facile aux enfants hospitalisés','category'=>'Solidarité','logo_url'=>'http://hopital-necker.aphp.fr/wp-content/blogs.dir/13/files/2017/11/Logo-Necker.png','is_company'=>'asso'}]
  
  company_array.each do |company|
    if company['is_company'] == "ent"
      one_company = Organization.create(
        city_id: City.all.sample.id,
        name: company['name'],
        description: company['description'],
        category: company['category'],
        logo_url: company['logo_url'],
        siret: Faker::Company.french_siret_number,
        is_association: false,
        is_company: true)
      company_count += 1
    else
      one_asso = Organization.create(
        city_id: City.all.sample.id,		
        name: company['name'],
        description: company['description'],
        category: company['category'],
        logo_url: company['logo_url'],
        RNA: ("w" + "#{rand(111111111..999999999)}"),
        is_association: true,
        is_company: false)
      association_count += 1
    end 
  end

  puts "#{company_count} companies created."
  puts "#{association_count} associations created."


#Organization.destroy_all
#company_count = 0
#association_count = 0
#10.times do
#	one_company = Organization.create(
#		city_id: City.all.sample.id,
#		name: Faker::Company.name,
#		description: Faker::Company.catch_phrase,
#		category: Faker::Company.type,
#		logo_url: Faker::Company.logo,
#		siret: Faker::Company.french_siret_number,
#		is_association: false,
#		is_company: true)
#	company_count += 1
#end
#10.times do
#	one_asso = Organization.create(
#		city_id: City.all.sample.id,		
#		name: Faker::Company.name,
#		description: Faker::Company.catch_phrase,
#		category: Faker::Company.type,
#		logo_url: Faker::Company.logo,
#		RNA: Faker::Company.french_siret_number,
#		is_association: true,
#		is_company: false)
#	association_count += 1
#end
# puts "#{company_count} companies created."
# puts "#{association_count} associations created."

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
  organizor = Organization.where("is_association":true).sample
  description = "Nous vous présentons ce super projet N°#{project_count}! #{organizor.name} est une association très impliquée dans le monde de #{organizor.category} à #{organizor.city.city_name}"
  Project.create(
    city_id: City.all.sample.id,
    organization_id: organizor.id,
    name: "Projet N°#{project_count} de #{organizor.name }" ,
    description: description ,
    logo_url: organizor.logo_url,
    starting_date: date = Faker::Date.forward(days: 20),
    donation_targeted: rand(100..100000),
    donation_start: date,
    donation_end: date.advance(days: 30))
  project_count += 1
end
puts "#{project_count} projects created."

Counterpart.destroy_all
counterpart_count = 0
projects = Project.all
projects.each do |project|
	4.times do
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
		donation_amount: rand(5..10000)
		)
	donation_count += 1
end
puts "#{donation_count} donations created."

Like.destroy_all
like_count = 0
30.times do
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
30.times do
	Follow.create(
		is_following: true,
		user_id: User.all.sample.id,
		organization_id: Organization.all.sample.id
		)
	follow_count += 1
end
puts "#{follow_count} follows created."

buzzword = ["environnement", "sociétal", "jeunesse", "faune", "plante", "réchauffement climatique", "biodiversité", "préservation", "nature", "éducation"]
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

ProjectLink.destroy_all
project_link_count = 0
Project.all.each do |project|
	ProjectLink.create(
		url_project: "https://assoangels.com/",
    url_name: "Facebook",
    project_id: project.id
    )
  ProjectLink.create(
    url_project: "https://assoangels.com/",
    url_name: "Instagram",
    project_id: project.id
    )
  ProjectLink.create(
    url_project: "https://assoangels.com/",
    url_name: "Site Web",
    project_id: project.id
    )
  project_link_count += 3
end

puts "#{project_link_count} project_links created."

OrganizationLink.destroy_all
organization_link_count = 0
Organization.all.each do |organization|
  OrganizationLink.create(
    url_organization: "https://assoangels.com/",
    url_name: "Facebook",
    organization_id: organization.id
    )
  OrganizationLink.create(
    url_organization: "https://assoangels.com/",
    url_name: "Instagram",
    organization_id: organization.id
    )
  OrganizationLink.create(
    url_organization: "https://assoangels.com/",
    url_name: "Site Web",
    organization_id: organization.id
    )
  organization_link_count += 3
end

puts "#{organization_link_count} organization_links created."

Alert.destroy_all
alert_count = 0
50.times do
	Alert.create(
		organization_id: Organization.all.sample.id,
		user_id: User.all.sample.id,
		city_id: City.all.sample.id,
		project_id: Project.all.sample.id,
		alert_name: "Alerte Rouge"
		)
	alert_count += 1
end
puts "#{alert_count} alerts created."