module PetStoreClient
  class HttpClientError < StandardError

    attr_reader :errors

    def initialize(custom_error_message, error_message='')
      super("\n#{custom_error_message}\nError: #{error_message}")
    end
  end
end
