require 'faraday'
require 'logger'
require 'resource_kit'

module PetStoreClient

  class Client
    include ResourceKit

    BASE_URI = 'https://petstore.swagger.io'

    attr_reader :access_token, :pet, :order, :conn

    def build_resources
      @pet = PetResource.new(connection: @conn)
      @order = OrderResource.new(connection: @conn)
    end

    def build_connection
      @conn ||= Faraday.new(url: BASE_URI) do |conn|
        conn.request :authorization, 'Bearer', @access_token
        conn.request :json
        conn.response :json, parser_options: { symbolize_names: true }
        conn.response :logger, @logger
        conn.adapter Faraday.default_adapter
      end
    end

    def initialize(token, logger)
      @access_token = token || ''
      @logger = logger
      build_connection
      build_resources
    end
  end
end
