module PetfinderService
  module Queries
    class Pets

      def initialize(pf_client, opts={})
        @client = pf_client
        @options = opts
        @location = @options[:location]
        @animal_type = @options[:animal_type]
        raise PetfinderService::Queries::Error.new('Location is required') unless @location.present?
        raise PetfinderService::Queries::Error.new('Animal Type is required') unless @animal_type.present?
      end

      def run
        @client.find_pets(@animal_type, @location, parse_options(@options)) 
      end

      private

      def parse_options(options)
        if options[:animal_type].present?
          options[:animal] = options.delete(:animal_type)
        end
        options
      end

    end
  end
end
