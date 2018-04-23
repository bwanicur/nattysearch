module PetfinderService
  module Queries
    class Organizations

      def initialize(pf_client, options={})
        @client = pf_client
        @options = options
        @location = @options[:location]
        raise PetfinderService::Queries::Error.new('Location is required') unless @location.present?
      end 
      
      def run
        @client.find_shelters(@location, parse_options(@options))
      end

      private

      def parse_options(options)
        if options[:limit].present?
          options[:count] = options[:limit]
          options.delete(:limit)
        end
        options
      end

    end
  end
end
