require_relative '../pet_store_client'

client = PetStoreClient::Client.new('', ::Logger.new(STDOUT))
created_pet = client.pet.create({id: 1, name: 'hello_world', photoUrls: ['http://image.com/image1.jpg'], status: 'available' })
# {id: 1, name: "hello_world", photoUrls: ["http://image.com/image1.jpg"], tags: [], status: "available"}

updated_pet = client.pet.update({id: created_pet[:id], name:'helloworld123', photoUrls: ['http://google.com/google.jpg']})
# {id: 1, name: "helloworld123", photoUrls: ["http://google.com/google.jpg"], tags: []}
removed_pet = client.pet.remove(id: created_pet[:id])
# true
get_pet = client.pet.find(id: 1)
# get_pet.nil? # true
get_pet = client.pet.find(id: 31)
# {id: 31, category: {id: 2, name: "perro"}, name: "Firulais", photoUrls: ["string"], tags: [{id: 1, name: "alegre"}], status: "available"}


new_pet_order = client.order.create({petId: 1, quantity: 12})
# {id: 8260070753011294469, petId: 1, quantity: 12, complete: false}
find_pet_order = client.order.find(id: 3)
# {id: 3, petId: 0, quantity: 0, shipDate: "2023-03-27T02:14:59.643+0000", status: "placed", complete: true}

removed_order = client.order.remove(id: new_pet_order[:id])
# removed_order true
pet_order = client.order.find(id: new_pet_order[:id])
# true
