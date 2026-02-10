require 'dry-struct'

module PetStoreClient


  class PetModel < Dry::Struct
    attribute :id, Dry.Types::Integer.optional
    attribute :category, CategoryModel
    attribute :name, Dry.Types::String.required
    attribute :photo_urls, Dry.Types::Array.of(Types::String).default([])
    attribute :tags, Dry.Types::Array.of(TagModel).default([]).optional
    attribute :status, Dry.Types::String.enum('available', 'pending', 'sold')
  end
end
