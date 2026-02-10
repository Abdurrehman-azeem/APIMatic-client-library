require_relative 'lib/pet_store_client'

client = PetStoreClient::Client.new('')
puts client.connection
puts client.resources
