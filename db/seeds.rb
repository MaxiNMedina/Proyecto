# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creando Residencias"
resAlex = Residence.create(name: "casa de Alex", dir: "La Plata", desc: "10/10", available: true)
resMaxi = Residence.create(name: "casa de Maxi", dir: "La Plata", desc: "excelente", available: true)
resVic = Residence.create(name: "casa de Victor", dir: "La Plata", desc: "super", available: false)

puts "Creando Subastas"
Auction.create(residence_id: resAlex.id, maxbid: 2000)
Auction.create(residence_id: resAlex.id, maxbid: 500)
Auction.create(residence_id: resVic.id, maxbid: 10000)
