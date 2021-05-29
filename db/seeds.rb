# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'seventhstar@mail.ru', password: 'password', password_confirmation: 'password') if User.count == 0

Contact.create!([{name: 'Телефон', value: '+79090912516'}, {name: 'E-mail', value: 'che.sfera@yandex.ru'}, {name: 'Адрес', value: 'г. Челябинск, пр. Ленина, д. 35, оф. 311'}]) if Contact.count == 0

Tarif.create(name: 'Базовый') if Tarif.count == 0