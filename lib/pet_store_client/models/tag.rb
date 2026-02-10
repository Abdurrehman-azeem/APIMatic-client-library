require 'dry-struct'

module PetStoreClient
  class TagModel < Dry::Struct
    attribute :id, Dry.Types::Integer.optional
    attribute :name, Dry.Types::String.optional
  end
end
