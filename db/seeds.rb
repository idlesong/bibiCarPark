# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#users
5.times do |i|
  User.create(name: "staff#{i+1}", password: "123456")
end

# lots
200.times do |i|
  Lot.create(mark: "Lot ##{i+1}", area: "A area", coordinate: "row:5, col:10")
end

#hubs, nodes & registrations
4.times do |i|
  hub = Hub.create(status: "work", hardware_id: "Hub#{i+1}", max_nodes: 100)

  50.times do |j|
    node = Node.create(hardware_id: "#{i*50+j+1}", status: 'idle' )
    Registration.create(node_id: node.id, hub_id: hub.id, role: 'main')
    Registration.create(node_id: node.id, role: 'alt')
  end
end


i =0
nodes = Node.all
nodes.each do |node|
  reg = node.registrations.where(role: 'alt').take
  if reg
    reg.hub_id = (1 + i/50) % 4 + 1
    reg.save
  end
  i = i+1
end

# parkings
100.times do |i|
  car = Car.create(plate: "沪A888#{i+1}")
  parking = car.parkings.create(enter_time: Time.now)
  node = Node.find(i+1)
  node.status = "busy"
  node.save
end
