# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Location.create(name: "Austin")


Computer.create({name: "pc-1", serial: "ABC123", location_id: 1})
Computer.create({name: "mac-1", serial: "ZYX098", location_id: 1})

AdobeAccount.create({email:'user@example.com'})