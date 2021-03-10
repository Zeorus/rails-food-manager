require 'faker'

puts "Clean DB Orders"
Order.destroy_all

puts "Clean DB customers"
Customer.destroy_all

puts "Clean DB Products"
Product.destroy_all

puts "Clean DB Category"
Category.destroy_all

platter = Category.create(name:"Platters")
noodle = Category.create(name:"Noodles")
fried_chicken = Category.create(name:"Frieds Chicken")
starter = Category.create(name:"Starters")
extra = Category.create(name:"Extras")
dessert = Category.create(name:"Desserts")
drink = Category.create(name:"Drinks")

puts "Created Category"

platters =[
  {
    name: 'Plateau ForTwo',
    price: 25.00,
    description: "46 pièces",
    price_in_menu: 0.00
  },
  {
    name: 'Plateau Daebak',
    price: 30.00,
    description: "46 pièces",
    price_in_menu: 0.00
  },
  {
    name: 'Plateau Solo',
    price: 8.50,
    description: "14 pièces au choix",
    price_in_menu: 0.00
  }
]

noodles = [
  {
    name: 'Nouilles Sautées Poulet',
    price: 7.00,
    description: "Nouilles composées de poulet, d'oeufs et de ciboulette accompagné de sauce siracha.",
    price_in_menu: 10.50
  },
  {
    name: 'Nouilles Sautées Crevettes',
    price: 9.00,
    description: "Nouilles composées de crevettes, d'oeufs et de ciboulette accompagné de sauce siracha.",
    price_in_menu: 12.50
  },
  {
    name: 'Nouilles Sautées Chicken Katsu',
    price: 8.50,
    description: "Nouilles composées d'une escalope frit avec un coulis de sauce aigre douce et d'un oeuf au plat.",
    price_in_menu: 12.50
  }
]

frieds_chicken = [
  {
    name: 'Wings GochujJang',
    price: 7.00,
    description: "5 Wings frit à la façon coréenne empreigné de la sauce \"GochujJang\" et de ciboulettes.",
    price_in_menu: 11.50
  },
  {
    name: 'Wings cream cheese & cheddar',
    price: 8.00,
    description: "5 Wings frit à la façon coréenne avec notre fameuse sauce \"Cream & Cheese\" et de ciboulettes.",
    price_in_menu: 11.50
  },
  {
    name: 'Tenders GochujJang',
    price: 8.00,
    description: "5 Tenders frit à la façon coréenne empreigné de la sauce \"GochujJang\" et de ciboulettes.",
    price_in_menu: 11.50
  },
  {
    name: 'Tenders cream cheese & cheddar',
    price: 8.00,
    description: "5 Tenders frit à la façon coréenne avec notre fameuse sauce \"Cream & Cheese\" et de ciboulettes.",
    price_in_menu: 11.50
  }
]

starters = [
  {
    name: 'Nems au poulet',
    price: 5.00,
    description: "4 Pièces de nems au poulet.",
    price_in_menu: 0.00
  },
  {
    name: 'Nems au crevettes',
    price: 5.00,
    description: "4 Pièces de nems au crevette.",
    price_in_menu: 0.00
  },
  {
    name: 'Rouleaux de crevettes',
    price: 5.00,
    description: "3 Pièces de crevettes enrobées de feuille de brique.",
    price_in_menu: 0.00
  },
  {
    name: 'Frite Maison',
    price: 3.00,
    description: "Frites fraichement découpé la veille.",
    price_in_menu: 0.00
  }
]

extras = [
  {
    name: 'Oignons frit',
    price: 1.00,
    description: "Oignons frit sur les frites.",
    price_in_menu: 0.00
  },
  {
    name: 'Cheddar',
    price: 1.00,
    description: "Cheddar sur les frites.",
    price_in_menu: 0.00
  },
  {
    name: 'Soja sucrée',
    price: 0.50,
    description: "Soja sucrée.",
    price_in_menu: 0.00
  },
  {
    name: 'Soja salée',
    price: 0.50,
    description: "Soja salée.",
    price_in_menu: 0.00
  },
  {
    name: 'Spicy thaï',
    price: 0.50,
    description: "Spicy thaï.",
    price_in_menu: 0.00
  },
  {
    name: 'Sauce Nem',
    price: 0.50,
    description: "Soja salée.",
    price_in_menu: 0.00
  }
]

desserts = [
  {
    name: 'Tiramisu Speculoos',
    price: 3.00,
    description: "Tiramisu à base de Speculoos.",
    price_in_menu: 0.00
  },
  {
    name: 'Tiramisu Oreo',
    price: 3.00,
    description: "Tiramisu à base d'Oreo.",
    price_in_menu: 0.00
  },
  {
    name: 'Tiramisu Bueno',
    price: 3.00,
    description: "Tiramisu à base de Kinder Bueno.",
    price_in_menu: 0.00
  }
]

drinks = [
  {
    name: 'Coca-Cola',
    price: 1.30,
    description: "",
    price_in_menu: 0.00
  },
  {
    name: 'Coca-Cherry',
    price: 1.30,
    description: "",
    price_in_menu: 0.00
  },
  {
    name: 'Coca-Zero',
    price: 1.30,
    description: "",
    price_in_menu: 0.00
  },
  {
    name: 'Sprite',
    price: 1.30,
    description: "",
    price_in_menu: 0.00
  },
  {
    name: 'Fanta Citron',
    price: 1.30,
    description: "",
    price_in_menu: 0.00
  },
  {
    name: 'Lipton Ice Tea',
    price: 1.30,
    description: "",
    price_in_menu: 0.00
  },
  {
    name: 'Oasis Tropical',
    price: 1.30,
    description: "",
    price_in_menu: 0.00
  }
]

puts "Create Products"

platters.each do |p|
  product = Product.new(p)
  product.category = platter
  product.save
end
puts "Platters created !"

noodles.each do |n|
  product = Product.new(n)
  product.category = noodle
  product.save

end

puts "Noodles created !"

frieds_chicken.each do |f|
  product = Product.new(f)
  product.category = fried_chicken
  product.save
end

puts "Frieds Chicken created !"

starters.each do |s|
  product = Product.new(s)
  product.category = starter
  product.save
end

puts "Starters created !"

extras.each do |e|
  product = Product.new(e)
  product.category = extra
  product.save
end

puts "Extras created !"

desserts.each do |d|
  product = Product.new(d)
  product.category = dessert
  product.save
end

puts "Desserts created !"

drinks.each do |d|
  product = Product.new(d)
  product.category = drink
  product.save
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
