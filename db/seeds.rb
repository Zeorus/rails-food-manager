require 'faker'

puts "Clean DB Delivery_routes"
DeliveryRoute.destroy_all

puts "Clean DB Orders"
Order.destroy_all

puts "Clean DB customers"
Customer.destroy_all

# puts "Clean DB Products"
# Product.destroy_all

# puts "Clean DB Category"
# Category.destroy_all

# platter = Category.create(name: "Platters", icon: "platters.png")
# noodle = Category.create(name: "Noodles", icon: "noodles.png")
# fried_chicken = Category.create(name: "Frieds Chicken", icon: "chicken.png")
# starter = Category.create(name: "Starters", icon: "starters.png")
# extra = Category.create(name: "Extras", icon: "extras.png")
# dessert = Category.create(name: "Desserts", icon: "desserts.png")
# drink = Category.create(name: "Drinks", icon: "drinks.png")

# puts "Created Category"

# platters =[
#   {
#     name: 'Plateau ForTwo',
#     price: 25.00,
#     description: "46 pièces",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Plateau Daebak',
#     price: 30.00,
#     description: "46 pièces",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Plateau Solo',
#     price: 8.50,
#     description: "14 pièces au choix",
#     price_in_menu: 0.00
#   }
# ]

# noodles = [
#   {
#     name: 'Nouilles Sautées Poulet',
#     price: 7.00,
#     description: "Nouilles composées de poulet, d'oeufs et de ciboulette accompagné de sauce siracha.",
#     price_in_menu: 10.50
#   },
#   {
#     name: 'Nouilles Sautées Crevettes',
#     price: 9.00,
#     description: "Nouilles composées de crevettes, d'oeufs et de ciboulette accompagné de sauce siracha.",
#     price_in_menu: 12.50
#   },
#   {
#     name: 'Nouilles Sautées Chicken Katsu',
#     price: 8.50,
#     description: "Nouilles composées d'une escalope frit avec un coulis de sauce aigre douce et d'un oeuf au plat.",
#     price_in_menu: 12.50
#   }
# ]

# frieds_chicken = [
#   {
#     name: 'Wings GochujJang',
#     price: 7.00,
#     description: "5 Wings frit à la façon coréenne empreigné de la sauce \"GochujJang\" et de ciboulettes.",
#     price_in_menu: 11.50
#   },
#   {
#     name: 'Wings cream & cheddar',
#     price: 8.00,
#     description: "5 Wings frit à la façon coréenne avec notre fameuse sauce \"Cream & Cheese\" et de ciboulettes.",
#     price_in_menu: 11.50
#   },
#   {
#     name: 'Tenders GochujJang',
#     price: 8.00,
#     description: "5 Tenders frit à la façon coréenne empreigné de la sauce \"GochujJang\" et de ciboulettes.",
#     price_in_menu: 11.50
#   },
#   {
#     name: 'Tenders cream & cheddar',
#     price: 8.00,
#     description: "5 Tenders frit à la façon coréenne avec notre fameuse sauce \"Cream & Cheese\" et de ciboulettes.",
#     price_in_menu: 11.50
#   }
# ]

# starters = [
#   {
#     name: 'Nems au poulet',
#     price: 5.00,
#     description: "4 Pièces de nems au poulet.",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Nems au crevettes',
#     price: 5.00,
#     description: "4 Pièces de nems au crevette.",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Rouleaux de crevettes',
#     price: 5.00,
#     description: "3 Pièces de crevettes enrobées de feuille de brique.",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Frite Maison',
#     price: 3.00,
#     description: "Frites fraichement découpé la veille.",
#     price_in_menu: 0.00
#   }
# ]

# extras = [
#   {
#     name: 'Oignons frit',
#     price: 1.00,
#     description: "Oignons frit sur les frites.",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Cheddar',
#     price: 1.00,
#     description: "Cheddar sur les frites.",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Soja sucrée',
#     price: 0.50,
#     description: "Soja sucrée.",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Soja salée',
#     price: 0.50,
#     description: "Soja salée.",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Spicy thaï',
#     price: 0.50,
#     description: "Spicy thaï.",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Sauce Nem',
#     price: 0.50,
#     description: "Soja salée.",
#     price_in_menu: 0.00
#   }
# ]

# desserts = [
#   {
#     name: 'Tiramisu Speculoos',
#     price: 3.00,
#     description: "Tiramisu à base de Speculoos.",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Tiramisu Oreo',
#     price: 3.00,
#     description: "Tiramisu à base d'Oreo.",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Tiramisu Bueno',
#     price: 3.00,
#     description: "Tiramisu à base de Kinder Bueno.",
#     price_in_menu: 0.00
#   }
# ]

# drinks = [
#   {
#     name: 'Coca-Cola',
#     price: 1.30,
#     description: "",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Coca-Cherry',
#     price: 1.30,
#     description: "",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Coca-Zero',
#     price: 1.30,
#     description: "",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Sprite',
#     price: 1.30,
#     description: "",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Fanta Citron',
#     price: 1.30,
#     description: "",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Lipton Ice Tea',
#     price: 1.30,
#     description: "",
#     price_in_menu: 0.00
#   },
#   {
#     name: 'Oasis Tropical',
#     price: 1.30,
#     description: "",
#     price_in_menu: 0.00
#   }
# ]

# puts "Create Products"

# platters.each do |p|
#   product = Product.new(p)
#   product.category = platter
#   product.save
# end
# puts "Platters created !"

# noodles.each do |n|
#   product = Product.new(n)
#   product.category = noodle
#   product.save

# end

# puts "Noodles created !"

# frieds_chicken.each do |f|
#   product = Product.new(f)
#   product.category = fried_chicken
#   product.save
# end

# puts "Frieds Chicken created !"

# starters.each do |s|
#   product = Product.new(s)
#   product.category = starter
#   product.save
# end

# puts "Starters created !"

# extras.each do |e|
#   product = Product.new(e)
#   product.category = extra
#   product.save
# end

# puts "Extras created !"

# desserts.each do |d|
#   product = Product.new(d)
#   product.category = dessert
#   product.save
# end

# puts "Desserts created !"

# drinks.each do |d|
#   product = Product.new(d)
#   product.category = drink
#   product.save
# end

# puts "Drinks created !"

# puts "#{Product.count} Products generated!"



puts "Generate Customers"
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0102030405",
                address: "39 rue Saint-Blaise", city: "Tourcoing", zip_code: "59200", full_address: "39 rue Saint-Blaise, 59200 Tourcoing")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0745421895",
                address: "35 rue de l'Epeule", city: "Roubaix", zip_code: "59100", full_address: "35 rue de l'Epeule, 59100 Roubaix")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0641287964",
                address: "23 rue Esquermoise", city: "Lille", zip_code: "59800", full_address: "23 rue Esquermoise, 59800 Lille")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0965847852",
                address: "91 Rue du Général Sarrail", city: "Roubaix", zip_code: "59100", full_address: "91 Rue du Général Sarrail, 59100 Roubaix")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0745876312",
                address: "122 rue Solférino", city: "Lille", zip_code: "59800", full_address: "122 rue Solférino, 59800 Lille")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0648571236",
                address: "15 rue du Faisan", city: "Lille", zip_code: "59800", full_address: "15 rue du Faisan, 59800 Lille")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0625789645",
                address: "1 place Notre Dame", city: "Tourcoing", zip_code: "59200", full_address: "1 place Notre Dame, 59200 Tourcoing")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0315784952",
                address: "101 boulevard Descat", city: "Tourcoing", zip_code: "59200", full_address: "101 boulevard Descat, 59200 Tourcoing")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0625489675",
                address: "52 rue Faidherbe", city: "Mouvaux", zip_code: "59420", full_address: "52 rue Faidherbe, 59420 Mouvaux")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0948657152",
                address: "18 rue Jean Jaurès", city: "Wattrelos", zip_code: "59150", full_address: "18 rue Jean Jaurès, 59150 Wattrelos")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0745312589",
                address: "12 rue du Maréchal Foch", city: "Roubaix", zip_code: "59100", full_address: "12 rue du Maréchal Foch, 59100 Roubaix")
Customer.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "0641251489",
                address: "12 rue Alain Savary", city: "Wattrelos", zip_code: "59150", full_address: "12 rue Alain Savary, 59150 Wattrelos")

puts "#{Customer.count} customers generated!"

# ----previous week ------
order_mon = []
order_tue = []
order_wed = []
order_thu = []
order_fri = []
order_sat = []
order_sun = []

15.times do
  order_mon << {
                  customer_id: (1..12).to_a.sample,
                  delivery_status: "delivered",
                  total_price: (20 .. 50).to_a.sample,
                  created_at: "Mon, 8 Mar 2021 09:41:54.240411000 UTC +00:00",
                  updated_at: "Mon, 8 Mar 2021 09:41:54.240411000 UTC +00:00",
  }
end

15.times do
  order_tue << {
                  customer_id: (1..12).to_a.sample,
                  delivery_status: "delivered",
                  total_price: (20 .. 50).to_a.sample,
                  created_at: "Tue, 9 Mar 2021 09:41:54.240411000 UTC +00:00",
                  updated_at: "Tue, 9 Mar 2021 09:41:54.240411000 UTC +00:00",
  }

end


15.times do
  order_wed << {
                  customer_id: (1..12).to_a.sample,
                  delivery_status: "delivered",
                  total_price: (20 .. 50).to_a.sample,
                  created_at: "Wed, 10 Mar 2021 09:41:54.240411000 UTC +00:00",
                  updated_at: "Wed, 10 Mar 2021 09:41:54.240411000 UTC +00:00",
  }
end

15.times do
  order_thu << {
                  customer_id: (1..12).to_a.sample,
                  delivery_status: "delivered",
                  total_price: (20 .. 50).to_a.sample,
                  created_at: "Thu, 11 Mar 2021 09:41:54.240411000 UTC +00:00",
                  updated_at: "Thu, 11 Mar 2021 09:41:54.240411000 UTC +00:00",
  }
end

15.times do
  order_sun << {
                  customer_id: (1..12).to_a.sample,
                  delivery_status: "delivered",
                  total_price: (20 .. 50).to_a.sample,
                  created_at: "Sun, 14 Mar 2021 09:41:54.240411000 UTC +00:00",
                  updated_at: "Sun, 14 Mar 2021 09:41:54.240411000 UTC +00:00",
  }
end

25.times do
  order_fri << {
                  customer_id: (1..12).to_a.sample,
                  delivery_status: "delivered",
                  total_price: (20 .. 50).to_a.sample,
                  created_at: "Fri, 12 Mar 2021 09:41:54.240411000 UTC +00:00",
                  updated_at: "Fri, 12 Mar 2021 09:41:54.240411000 UTC +00:00",
  }
end

25.times do
  order_sat << {
                  customer_id: (1..12).to_a.sample,
                  delivery_status: "delivered",
                  total_price: (20 .. 50).to_a.sample,
                  created_at: "Sat, 13 Mar 2021 09:41:54.240411000 UTC +00:00",
                  updated_at: "Sat, 13 Mar 2021 09:41:54.240411000 UTC +00:00",
  }
end

order_mon.each do |a|
  Order.create!(a)
end

puts "#{order_mon.count} orders monday created"

order_tue.each do |b|
  Order.create!(b)
end

puts "#{order_tue.count} orders tuesday created"

order_wed.each do |c|
  Order.create!(c)
end

puts "#{order_wed.count} orders wednesday created"

order_thu.each do |d|
  Order.create!(d)
end

puts "#{order_thu.count} orders thusday created"

order_fri.each do |e|
  Order.create!(e)
end

puts "#{order_fri.count} orders friday created"

order_sat.each do |f|
  Order.create!(f)
end

puts "#{order_sat.count} orders saturday created"

order_sun.each do |g|
  Order.create!(g)
end

puts "#{order_sun.count} orders sunday created"

# ----actual week ------
mon = []
tue = []
# wed = []


15.times do
  mon << {
                  customer_id: (1..12).to_a.sample,
                  delivery_status: "delivered",
                  total_price: (20 .. 50).to_a.sample,
                  created_at: "Mon, 15 Mar 2021 09:41:54.240411000 UTC +00:00",
                  updated_at: "Mon, 15 Mar 2021 09:41:54.240411000 UTC +00:00",
  }
end

15.times do
  tue << {
                  customer_id: (1..12).to_a.sample,
                  delivery_status: "delivered",
                  total_price: (20 .. 50).to_a.sample,
                  created_at: "Tue, 16 Mar 2021 09:41:54.240411000 UTC +00:00",
                  updated_at: "Tue, 16 Mar 2021 09:41:54.240411000 UTC +00:00",
  }
end


# 15.times do
#   wed << {
#                   customer_id: (1..12).to_a.sample,
#                   delivery_status: "delivered",
#                   total_price: (20 .. 50).to_a.sample,
#                   created_at: "Wed, 17 Mar 2021 09:41:54.240411000 UTC +00:00",
#                   updated_at: "Wed, 17 Mar 2021 09:41:54.240411000 UTC +00:00",
#   }
# end


mon.each do |a|
  Order.create!(a)
end

puts "#{mon.count} orders monday created"

tue.each do |b|
  Order.create!(b)
end

puts "#{tue.count} orders tuesday created"

# wed.each do |c|
#   Order.create!(c)
# end

# puts "#{wed.count} orders wednesday created"

