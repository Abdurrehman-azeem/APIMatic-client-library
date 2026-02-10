require 'dry-struct'

module PetStoreClient
  class OrderModel < Dry::Struct
    attribute :id, Dry.Types::Integer.optional
    attribute :pet_id, Dry.Types::Integer
    attribute :quantity, Dry.Types::Integer
    attribute :ship_date, Dry.Types::DateTime
    attribute :status, Dry.Types::String.enum('placed', 'approved', 'delivered')
    attribute :complete, Dry.Types::Bool.default(false)
  end
end
