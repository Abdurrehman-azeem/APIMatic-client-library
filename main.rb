require_relative 'lib/pet_store_client'

client = PetStoreClient::Client.new('', ::Logger.new(STDOUT))
petModel = client.resources[:pet].create({id: 1, name: 'hello_world', photoUrls: ['http://image.com/image1.jpg'], status: 'available' })
puts petModel[:id], petModel[:name], petModel[:category], petModel[:tags], petModel[:photoUrls]
puts petModel.to_h
updated_pet = client.resources[:pet].update({id: petModel[:id], name:'helloworld123', photoUrls: ['http://google.com/google.jpg']})
puts updated_pet
removed_pet = client.resources[:pet].remove(id: petModel[:id])
puts "checking if removed", client.resources[:pet].find(id: petModel[:id]).nil?

new_pet_order = client.resources[:order].create({petId: 1, quantity: 12})
puts new_pet_order

removed_order = client.resources[:order].remove(id: new_pet_order[:id])
puts removed_order
pet_order = client.resources[:order].find(id: new_pet_order[:id])
puts pet_order.nil?
