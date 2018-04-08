module PetfinderService
  module Queries
    class SearchPets

      def initialize(pf_client, opts={})
        @client = pf_client
        @options = opts
        @location = @options[:location]
        raise PetfinderService::Queries::Error.new('Location is required') unless @location.present?
      end

      def run
        @client.find_pets(@location, options) 
      end

    end
  end
end
