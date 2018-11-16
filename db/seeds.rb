require 'date'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creando Residencias"
resAlex = Residence.create(name: "casa de Alex", dir: "La Plata", desc: "10/10", available: true, image_url: "residencia_1.jpg")
resMaxi = Residence.create(name: "casa de Maxi", dir: "La Plata", desc: "excelente", available: true, image_url: "residencia_2.jpg")
resVic = Residence.create(name: "casa de Victor", dir: "La Plata", desc: "super", available: false)

puts "Creando Subastas"
Auction.create(residence_id: resAlex.id, maxbid: 2000, dateStart: Date.new(2018,11,27), dateEnd: Date.new(2018,11,30))
Auction.create(residence_id: resAlex.id, maxbid: 500, dateStart: Date.new(2019,10,28), dateEnd: Date.new(2019,10,31))
Auction.create(residence_id: resVic.id, maxbid: 10000, dateStart: Date.new(2019,2,10), dateEnd: Date.new(2019,2,13))

puts "Creando Administradores"
User.create(userName: "alex", email: "alex@mail.com", password: "alex123", credits: 2, isAdmin: true)
User.create(userName: "maxi",email: "maxi@mail.com", password: "maxi123", credits: 2, isAdmin: true)
User.create(userName: "vic",email: "victor@mail.com", password: "vic123", credits: 2, isAdmin: true)

puts "Creando Usuarios"
User.create(userName: "alex", email: "alex@mail.com", password: "alex123", credits: 2, isAdmin: false)
User.create(userName: "maxi",email: "maxi@mail.com", password: "maxi123", credits: 2, isAdmin: false)
User.create(userName: "vic",email: "victor@mail.com", password: "vic123", credits: 2, isAdmin: false)
