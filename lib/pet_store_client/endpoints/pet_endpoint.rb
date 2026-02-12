module PetStoreClient
  class PetResource < ResourceKit::Resource
    resources do
      action :find do
        verb :get
        path 'v2/pet/:id'
        handler(200) do |response|
          response.body
        end
        handler(404) do |response|
          # An empty response can be expected.
          nil
        end
        handler(400) do |response|
          raise HttpClientError.new("Bad Request", response.body.to_h)
        end
      end

      action :create do
        verb :post
        path 'v2/pet/'
        body do |object|
          validated_pet = PetValidator.new.call(object)
          if validated_pet.failure?
            raise ValidationError.new(validated_pet.errors, "Payload failed validation for pet creation.")
          end

          validated_pet.to_h.to_json
        end
        handler(200, 201) do |response|
          response.body
        end
        handler(400) do |response|
          raise HttpClientError.new("Bad request", response.body[:message])
        end
        handler(405) do |response|
          raise HttpClientError.new("Invalid input provided for pet creation", response.body[:message])
        end
        handler(500) do |response|
          raise HttpClientError.new("Server error encountered, could not create pet.", response.body[:message])
        end
      end

      action :update do
        verb :put
        path 'v2/pet/'
        body do |object|
          validated_partial_pet = PartialPetValidator.new.call(object)
          if validated_partial_pet.failure?
            raise ValidationError.new(validated_partial_pet.errors, "Payload failed validation for pet creation.")
          end
          validated_partial_pet.to_h.to_json

        end
        handler(200, 201) do |response|
          response.body
        end
        handler(400) do |response|
          raise HttpClientError.new("Bad request.", response.body[:message])
        end
        handler(404) do |response|
          raise HttpClientError.new("Could not find pet to update.", response.body[:message])
        end
        handler(405) do |response|
          raise HttpClientError.new("Invalid input provided for pet update.", response.body[:message])
        end
      end

      action :remove do
        verb :delete
        path 'v2/pet/:id'
        handler(200, 204) do |response|
          true
        end
        handler(400) do |response|
          raise HttpClientError.new("Server error encountered, could not remove pet.", response.body[:message])
        end
        handler(404) do |response|
          raise HttpClientError.new("Could not find pet to delete.")
        end
      end
    end
  end
end
