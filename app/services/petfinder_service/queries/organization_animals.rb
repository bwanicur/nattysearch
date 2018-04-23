module PetfinderService
  module Queries
    class OrganizationAnimals

      PET_STAUSES = {
        adoptable: 'A',
        hold: 'H',
        pending: 'P',
        adopted_or_removed: 'X'
      }
      
      def initialize(pf_client, options={})
        @client = pf_client
        @options = options
        @shelter_id = @options.delete(:id)
        unless @shelter_id.present?
          raise PetfinderService::Queries::Error.new('Shelter ID is required')
        end
      end

      def run
        @client.shelter_pets(@shelter_id, parse_options(@options))
      end

      private

      def parse_options(options)
        if options[:limit].present?
          options[:count] = options.delete(:limit)
        end
        unless options[:status].present?
          options[:status] = PET_STAUSES[:adoptable]
        end
        options
      end

    end
  end
end
