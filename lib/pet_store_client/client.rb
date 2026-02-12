require 'faraday'
require 'logger'
require 'resource_kit'

module PetStoreClient

  class Client
    include ResourceKit

    PET_STORE_CLIENT = 'https://petstore.swagger.io'.freeze

    attr_reader :access_token, :connection

    def resources
      {
        pet: PetResource.new(connection: @connection),
        order: OrderResource.new(connection: @connection)
      }
    end

    def initialize(token, logger)
      @access_token = token || ''
      @logger = logger
      connection

      resources.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def connection
      @connection ||= Faraday.new(url: PET_STORE_CLIENT) do |conn|
        conn.request :authorization, 'Bearer', @access_token
        conn.request :json
        conn.response :json, parser_options: { symbolize_names: true }
        #conn.response :logger, @logger
        conn.adapter Faraday.default_adapter
      end
    end
  end
end
