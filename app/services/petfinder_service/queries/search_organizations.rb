module PetfinderService
  module Queries
    class SearchOrganizations

      def initialize(pf_client, options={})
        @client = pf_client
        @options = options
        @location = @options[:location]
        raise PetfinderService::Queries::Error.new('Location is required') unless @location.present?
      end 
      
      def run
        @client.find_shelters(@location, @options) 
      end

    end
  end
end
