require 'test_helper'

class PetStoreClientTest < MiniTest::Test
  def setup
    PetStoreClient::Client.send(:remove_instance_variable, :conn)

    @test_adapter = Faraday::Adapter::Test.new do |stub|
      stub.get('v2/pet/3') do
        [200, { 'Content-Type' => 'application/json' }, '{
          "id": 3,
          "category": {
            "id": 6,
            "name": "doggiepic1"
          },
          "name": "doggie",
          "photoUrls": [
            "string"
          ],
          "tags": [
            {
              "id": 0,
              "name": "string"
            }
          ],
          "status": "available"
        }']
      end

      stub.get('v2/pet/-1') do
        [404, { 'Content-Type' => 'application/json' }, '{
          "code": 1,
          "type": "error",
          "message": "Pet not found"
        }']
      end
    end
    conn = PetStoreClient::Client.new('test-key').connection
    conn.builder.insert(0, @test_adapter)
    @client = PetStoreClient::Client.new('test-key')
    @client.instance_variable_set(:@conn, conn)
  end

  def test_find_pet
    pet = @client.pet.create(name: 'buddy', photoUrls: ['http://google.com/google.jpg'])
    assert_equal pet[:name], 'buddy'
  end
end
