require 'date'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creando Residencias"
resAlex = Residence.create(name: "casa de Alex", country: "Argentina", province: "Buenos Aires", locality:"La Plata",  dir: "Plaza España N°75", desc: "10/10", available: true, image_url: "residencia_1.jpg")
resMaxi = Residence.create(name: "casa de Maxi", country: "Argentina", province: "Buenos Aires", locality:"La Plata", dir: "Avenida 44 N°1877", desc: "excelente", available: true, image_url: "residencia_2.jpg")
resVic = Residence.create(name: "casa de Victor", country: "Argentina", province: "Buenos Aires", locality:"La Plata", dir: "Calle 28 N°120", desc: "super", available: true, image_url: "https://articles-images.sftcdn.net/wp-content/uploads/sites/2/2018/09/casa-alquiler.jpg")

res_array = [resAlex, resMaxi, resVic]
puts "Cargando base de datos de disponibilidad de residencias"
puts "Esto puede tardar unos minutos"
res_array.each do |res|
	AvailabilityController.init(res.id)
end
puts "La carga se ha completado"

puts "Creando Administradores"
admAlex = User.create(userName: "alex", email: "alex@mail.com", password: "alex123", credits: 2, isAdmin: true, isPremium: 'no')
admMaxi = User.create(userName: "maxi",email: "maxi@mail.com", password: "maxi123", credits: 2, isAdmin: true, isPremium: 'no')
admVic = User.create(userName: "vic",email: "victor@mail.com", password: "vic123", credits: 2, isAdmin: true, isPremium: 'no')

puts "Creando Subastas"
Auction.create(residence_id: resAlex.id, maxbid: 2000, dateStart: Date.new(2018,11,27), dateEnd: Date.new(2018,11,30), user_id: admAlex.id, availability_id: 10)
Auction.create(residence_id: resAlex.id, maxbid: 500, dateStart: Date.new(2019,10,28), dateEnd: Date.new(2019,10,31), user_id: admMaxi.id, availability_id: 80 )
Auction.create(residence_id: resVic.id, maxbid: 10000, dateStart: Date.new(2019,2,10), dateEnd: Date.new(2019,2,13), user_id: admVic.id, availability_id: 130)

puts "Creando Usuarios"
User.create(userName: "pepe", email: "pepe@mail.com", password: "pepe123", credits: 2, isAdmin: false, isPremium: 'no', name: "Pepe", surname: "Fulano", birthday: Date.new(1934,10,31), credit_card_number: 1111222233331111, cvv: 123, card_expiry_date: Date.new(2019,11,30))
User.create(userName: "jose",email: "jose@mail.com", password: "jose123", credits: 2, isAdmin: false, isPremium: 'si', name: "Jose", surname: "Mengano", birthday: Date.new(1958,8,7), credit_card_number: 1111222233332222, cvv: 123, card_expiry_date: Date.new(2020,3,30))
User.create(userName: "maria",email: "maria@mail.com", password: "maria123", credits: 2, isAdmin: false, isPremium: 'no', name: "Maria", surname: "De Tal", birthday: Date.new(1973,10,6), credit_card_number: 1111222233333333, cvv: 123, card_expiry_date: Date.new(2021,5,30))
User.create(userName: "juanperez", email: "juanperez@gmail.com ", password: "12345678", credits: 2, isAdmin: false, isPremium: 'no', name: "Juan", surname: "Perez", birthday: Date.new(1992,5,29), credit_card_number: 12345678901234567, cvv: 123, card_expiry_date: Date.new(2022,5,30))

puts "Creando Reservas"
Reservation.create(residence_id: resMaxi.id, user_id: 4)
Reservation.create(residence_id: resAlex.id, user_id: admMaxi.id)
Reservation.create(residence_id: resVic.id, user_id: admVic.id)
