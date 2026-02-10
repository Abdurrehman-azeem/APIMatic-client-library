require "faraday"

module PetStoreClient
  class Client
    PET_STORE_CLIENT = 'https://petstore.swagger.io/v2'

    attr_reader :access_token

    def initialize(token)
      @access_token = token || ''
    end


  end
end
