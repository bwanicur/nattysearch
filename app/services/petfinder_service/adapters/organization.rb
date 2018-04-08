module PetfinderService
  module Adapters
    class Organization

      PETFINDER_SHELTER_ATTS = [
        :id, 
        :name, 
        :address1, 
        :address2, 
        :city, 
        :state, 
        :zip, 
        :country,
        :latitude, 
        :longitude, 
        :phone, 
        :fax, 
        :email
      ]
      
      def initialize(shelter_obj)
        @data = {}
        PETFINDER_SHELTER_ATTS.each do |att|
          @data[att] = shelter_obj.send(att)
        end
      end
      
      def atts_to_hash
        @data[:pf_id] = pf_id
        @data.delete(:id)
        @data[:zipcode] = zipcode
        @data.delete(:zip)
        @data
      end

      private 

      def pf_id
        @data[:id]
      end

      def zipcode
        @data[:zip]
      end

    end
  end
end
