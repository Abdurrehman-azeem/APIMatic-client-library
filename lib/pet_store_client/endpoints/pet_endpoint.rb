module PetStoreClient
  class PetResource < ResourceKit::Resource
    resources do
      action :find do
        verb :get
        path '/pet/:id'
        handler(200) { |response| puts response.body }
      end
    end
  end
end
