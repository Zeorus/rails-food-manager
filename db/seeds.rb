require 'faker'

puts "Clean DB customers"
Customer.destroy_all

puts "Clean DB Products"
Product.destroy_all

platters =[
  {
    name: 'Plateau ForTwo',
    price: 25.00,
    description: "46 pièces",
    category: "meal",
    under_category: "sushis",
    price_in_menu: 0.00
  },
  {
    name: 'Plateau Daebak',
    price: 30.00,
    description: "46 pièces",
    category: "meal",
    under_category: "sushis",
    price_in_menu: 0.00
  },
  {
    name: 'Plateau Solo',
    price: 8.50,
    description: "14 pièces au choix",
    category: "meal",
    under_category: "sushis",
    price_in_menu: 0.00
  }
]

noodles = [
  {
    name: 'Nouilles Sautées Poulet',
    price: 7.00,
    description: "Nouilles composées de poulet, d'oeufs et de ciboulette accompagné de sauce siracha.",
    category: "meal",
    under_category: "Nouilles",
    price_in_menu: 10.50
  },
  {
    name: 'Nouilles Sautées Crevettes',
    price: 9.00,
    description: "Nouilles composées de crevettes, d'oeufs et de ciboulette accompagné de sauce siracha.",
    category: "meal",
    under_category: "Nouilles",
    price_in_menu: 12.50
  },
  {
    name: 'Nouilles Sautées Chicken Katsu',
    price: 8.50,
    description: "Nouilles composées d'une escalope frit avec un coulis de sauce aigre douce et d'un oeuf au plat.",
    category: "meal",
    under_category: "Nouilles",
    price_in_menu: 12.50
  }
]

frieds_chicken = [
  {
    name: 'Wings GochujJang',
    price: 7.00,
    description: "5 Wings frit à la façon coréenne empreigné de la sauce \"GochujJang\" et de ciboulettes.",
    category: "meal",
    under_category: "Poulet Frit",
    price_in_menu: 11.50
  },
  {
    name: 'Wings cream cheese & cheddar',
    price: 8.00,
    description: "5 Wings frit à la façon coréenne avec notre fameuse sauce \"Cream & Cheese\" et de ciboulettes.",
    category: "meal",
    under_category: "Poulet Frit",
    price_in_menu: 11.50
  },
  {
    name: 'Tenders GochujJang',
    price: 8.00,
    description: "5 Tenders frit à la façon coréenne empreigné de la sauce \"GochujJang\" et de ciboulettes.",
    category: "meal",
    under_category: "Poulet Frit",
    price_in_menu: 11.50
  },
  {
    name: 'Tenders cream cheese & cheddar',
    price: 8.00,
    description: "5 Tenders frit à la façon coréenne avec notre fameuse sauce \"Cream & Cheese\" et de ciboulettes.",
    category: "meal",
    under_category: "Poulet Frit",
    price_in_menu: 11.50
  }
]

starters = [
  {
    name: 'Nems au poulet',
    price: 5.00,
    description: "4 Pièces de nems au poulet.",
    category: "Accompagnement",
    under_category: "Nem",
    price_in_menu: 0.00
  },
  {
    name: 'Nems au crevettes',
    price: 5,
    description: "4 Pièces de nems au crevette.",
    category: "Accompagnement",
    under_category: "Nem",
    price_in_menu: 0.00
  },
  {
    name: 'Rouleaux de crevettes',
    price: 5.00,
    description: "3 Pièces de crevettes enrobées de feuille de brique.",
    category: "Accompagnement",
    under_category: "Nem",
    price_in_menu: 0.00
  },
  {
    name: 'Frite Maison',
    price: 3.00,
    description: "Frites fraichement découpé la veille.",
    category: "Accompagnement",
    under_category: "Frite",
    price_in_menu: 0.00
  }
]

extras = [
  {
    name: 'Oignons frit',
    price: 1.00,
    description: "Oignons frit sur les frites.",
    category: "Accompagnement",
    under_category: "Supplément",
    price_in_menu: 0.00
  },
  {
    name: 'Cheddar',
    price: 1.00,
    description: "Cheddar sur les frites.",
    category: "Accompagnement",
    under_category: "Supplément",
    price_in_menu: 0.00
  },
  {
    name: 'Soja sucrée',
    price: 0.50,
    description: "Soja sucrée.",
    category: "Accompagnement",
    under_category: "Supplément",
    price_in_menu: 0.00
  },
  {
    name: 'Soja salée',
    price: 0.50,
    description: "Soja salée.",
    category: "Accompagnement",
    under_category: "Supplément",
    price_in_menu: 0.00
  },
  {
    name: 'Spicy thaï',
    price: 0.50,
    description: "Spicy thaï.",
    category: "Accompagnement",
    under_category: "Supplément",
    price_in_menu: 0.00
  },
  {
    name: 'Sauce Nem',
    price: 0.50,
    description: "Soja salée.",
    category: "Accompagnement",
    under_category: "Supplément",
    price_in_menu: 0.00
  }
]

desserts = [
  {
    name: 'Tiramisu Speculoos',
    price: 3.00,
    description: "Tiramisu à base de Speculoos.",
    category: "Dessert",
    under_category: "Tiramisu",
    price_in_menu: 0.00
  },
  {
    name: 'Tiramisu Oreo',
    price: 3.00,
    description: "Tiramisu à base d'Oreo.",
    category: "Dessert",
    under_category: "Tiramisu",
    price_in_menu: 0.00
  },
  {
    name: 'Tiramisu Bueno',
    price: 3.00,
    description: "Tiramisu à base de Kinder Bueno.",
    category: "Dessert",
    under_category: "Tiramisu",
    price_in_menu: 0.00
  }
]

drinks = [
  {
    name: 'Coca-Cola',
    price: 1.30,
    description: "",
    category: "Boisson",
    under_category: "Boisson",
    price_in_menu: 0.00
  },
  {
    name: 'Coca-Cherry',
    price: 1.30,
    description: "",
    category: "Boisson",
    under_category: "Boisson",
    price_in_menu: 0.00
  },
  {
    name: 'Coca-Zero',
    price: 1.30,
    description: "",
    category: "Boisson",
    under_category: "Boisson",
    price_in_menu: 0.00
  },
  {
    name: 'Sprite',
    price: 1.30,
    description: "",
    category: "Boisson",
    under_category: "Boisson",
    price_in_menu: 0.00
  },
  {
    name: 'Fanta Citron',
    price: 1.30,
    description: "",
    category: "Boisson",
    under_category: "Boisson",
    price_in_menu: 0.00
  },
  {
    name: 'Lipton Ice Tea',
    price: 1.30,
    description: "",
    category: "Boisson",
    under_category: "Boisson",
    price_in_menu: 0.00
  },
  {
    name: 'Oasis Tropical',
    price: 1.30,
    description: "",
    category: "Boisson",
    under_category: "Boisson",
    price_in_menu: 0.00
  }
]

puts "Create Products"

platters.each do |platter|
  Product.create!(platter)
end

puts "Platters created !"

noodles.each do |noodle|
  Product.create!(noodle)
end

puts "Noodles created !"

frieds_chicken.each do |fried_chicken|
  Product.create!(fried_chicken)
end

puts "Frieds Chicken created !"

starters.each do |starter|
  Product.create!(starter)
end

puts "Starters created !"

extras.each do |extra|
  Product.create!(extra)
end

puts "Extras created !"

desserts.each do |dessert|
  Product.create!(dessert)
end

puts "Deserts created !"

drinks.each do |drink|
  Product.create!(drink)
end

puts "Drinks created !"

puts "#{Product.count} Products generated!"



puts "Generate Customers"
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0654789645",
                address: "57 quai Saint-Nicolas", city: "Tourcoing", zip_code: "59200")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0745421895",
                address: "35 rue de l'Epeule", city: "Roubaix", zip_code: "59100")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0641287964",
                address: "4 Chemin Challet", city: "Lille", zip_code: "59000")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0965847852",
                address: "91 Rue du Général Sarrail", city: "Roubaix", zip_code: "59100")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0745876312",
                address: "122 rue Solférino", city: "Lille", zip_code: "59000")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0648571236",
                address: "15 rue du Faison", city: "Lille", zip_code: "59000")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0625789645",
                address: "1 place Notre Dame", city: "Tourcoing", zip_code: "59200")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0315784952",
                address: "101 boulevard Descat", city: "Tourcoing", zip_code: "59200")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0625489675",
                address: "228 rue Carnot", city: "Wattrelos", zip_code: "59150")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0948657152",
                address: "18 rue Jean Jaurès", city: "Wattrelos", zip_code: "59150")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0745312589",
                address: "12 rue du Maréchal Foch", city: "Roubaix", zip_code: "59100")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0641251489",
                address: "12 rue Alain Savary", city: "Wattrelos", zip_code: "59150")

puts "#{Customer.count} customers generated!"

