require 'dry-validation'

module PetStoreClient
  class PetValidator < Dry::Validation::Contract
    params do
      optional(:id).filled(:integer, gteq?: 0)
      required(:name).filled(:string)
      required(:photoUrls).array(:string)
      optional(:tags).array(:hash) do
        required(:id).filled(:integer, gteq?: 0)
        required(:name).filled(:string)
      end
      optional(:category).array(:hash) do
        required(:id).filled(:integer, gteq?: 0)
        required(:name).filled(:string)
      end
      optional(:status).filled(:string, included_in?: %w[available pending sold])
    end
  end

  class PartialPetValidator < Dry::Validation::Contract
    params do
      optional(:id).filled(:integer, gteq?: 0)
      optional(:name).filled(:string)
      optional(:photoUrls).array(:string)
      optional(:tags).array(:hash) do
        optional(:id).filled(:integer, gteq?: 0)
        optional(:name).filled(:string)
      end
      optional(:category).array(:hash) do
        optional(:id).filled(:integer, gteq?: 0)
        optional(:name).filled(:string)
      end
      optional(:status).filled(:string, included_in?: %w[available pending sold])
    end
  end
end
