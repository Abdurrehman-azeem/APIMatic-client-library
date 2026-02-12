module PetStoreClient
  class ValidationError < StandardError

    attr_reader :errors

    def initialize(errors, custom_error_message)
      @errors = errors.to_h
      super("\n#{custom_error_message}\nValidation failed: #{errors.to_h}")
    end
  end

  class ResponseValidationError < StandardError

    def initialize(error)
      super("\nFor some of the retrieved data from petstore you may notice that the data may not follow the conventions outlined in the endpoint's model leading to validation issues. A similar error has been encountered. \nValidation failed: #{error}")
    end
  end
end
