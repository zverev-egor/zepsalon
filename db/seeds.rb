# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




#Создание администратора
login=`whoami`.strip
email="#{login}@mail.msiu.ru"
password=login*2
User.create!(name: login, email: email, password: password,password_confirmation: password, role: 1)
