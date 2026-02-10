require 'faraday'
require 'logger'
require 'resource_kit'

module PetStoreClient

  class Client
    include ResourceKit
    PET_STORE_CLIENT = 'https://petstore.swagger.io/v2'

    attr_reader :access_token, :connection

    def initialize(token)
      @access_token = token || ''
      connection
      resources
    end

    def connection
      @connection ||= Faraday.new(url: PET_STORE_CLIENT) do |conn|
        conn.request :authorization, 'Bearer', @access_token
        conn.request :json

        conn.response :json, content_type: 'application/json'
        conn.response :raise_error
        conn.response :logger, Logger

        conn.adapter Faraday.default_adapter
      end
    end

    def resources
      {
        pet: PetResource.new(connection: @connection)
      }
    end

  end
end
