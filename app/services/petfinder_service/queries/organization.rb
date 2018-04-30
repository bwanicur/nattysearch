module PetfinderService
  module Queries
    class Organization

      def initialize(pf_client, pf_org_id)
        @client = pf_client
        @org_id = pf_org_id 
        raise PetfinderService::Queries::Error.new('Petfinder Shelter ID is required') unless @org_id.present?
      end 

      def run
        @client.shelter(@org_id)
      end

    end
  end
end
 
