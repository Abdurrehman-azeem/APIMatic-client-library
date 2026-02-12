module PetStoreClient
  class OrderResource < ResourceKit::Resource
    resources do
      action :find do
        verb :get
        path 'v2/store/order/:id'
        handler(200) do |response|
          response.body
        end
        handler(404) do |response|
          nil
        end
      end

      action :create do
        verb :post
        path 'v2/store/order'
        body do |object|
          validated_order = OrderValidator.new.call(object)
          if validated_order.failure?
            raise ValidationError.new(validated_order.errors, "Payload failed validation for order creation.")
          end

          validated_order.to_h.to_json
        end

        handler(200, 201) do |response|
          response.body
        end

        handler(400) do |response|
          raise HttpClientError.new("Bad request, could not create order.", response.body[:message])
        end

        handler(500) do |response|
          raise HttpClientError.new("Server error encountered, could not create order.", response.body[:message])
        end
      end

      action :remove do
        verb :delete
        path 'v2/store/order/:id'
        handler(200, 204) do |response|
          true
        end
        handler(400) do |response|
          raise HttpClientError.new("Bad Request, could not delete order.", response.body[:message])
        end
        handler(404) do |response|
          raise HttpClientError.new("Order not found.", response.body[:message])
        end
      end
    end
  end
end
