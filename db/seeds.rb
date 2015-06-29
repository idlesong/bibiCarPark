# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# 100.times do |i|
#   Lot.create(mark: "Lot ##{i}", area: "A area", coordinate: "row:5, col:10")
# end
#
# 100.times do |i|
#   Car.create(plate: "沪CJ #{i}")
# end

# 4.times do |i|
#   hub = Hub.create(status: "OK", hardware_id: "Hub#{i}", max_nodes: 100)
#
#   50.times do |j|
#     node = Node.create(hardware_id: "Node#{i*50+j}", status: 'green' )
#     Registration.create(node_id: node.id, hub_id: hub.id, role: 'main')
#     Registration.create(node_id: node.id, role: 'alt')
#   end
#
# end
#
# hubs = Hub.find([7,8,9,10])
#
# hubs.each do |hub|
#   hub.status = "regist"
#   hub.save
# end
#
# hubs.each do |hub|
#   50.times do |i|
#
#   end
# end

i =0

Node.find_each(start: 4, batch_size: 200) do |node|
  reg = node.registrations.where(role: 'alt').take
  if reg
    reg.hub_id = (1 + i/50) % 4 + 7
    reg.save
  end
  i = i+1
end

# regs = Registration.where(role: 'alt').order(:node_id)
#
# regs.each do |reg|
#   reg.hub_id = 7 + i/50
# end
