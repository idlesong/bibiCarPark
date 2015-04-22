# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


100.times do |i|
  Lot.create(mark: "Lot ##{i}", area: "A area", coordinate: "row:5, col:10")
end

100.times do |i|
  Car.create(plate: "沪CJ #{i}")
end
