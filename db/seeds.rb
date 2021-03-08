# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Clean DB customers"
Customer.destroy_all

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
