require 'dry-struct'

module PetStoreClient
  class CategoryModel < Dry::Struct
    attribute :id, Dry.Types::Integer.optional
    attribute :name, Dry.Types::String.optional
  end
end
