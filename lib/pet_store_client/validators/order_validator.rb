require 'dry-validation'

module PetStoreClient
  class OrderValidator < Dry::Validation::Contract
    params do
      optional(:id).filled(:integer, gteq?: 0)
      required(:petId).filled(:integer, gteq?: 0)
      required(:quantity).filled(:integer, gteq?: 0)
      optional(:ship_date).filled(:time)
      optional(:status).filled(:string, included_in?: %w[placed approved delivered])
      optional(:complete).value(:bool)
    end
  end
end
