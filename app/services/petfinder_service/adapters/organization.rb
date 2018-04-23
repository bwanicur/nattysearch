module PetfinderService
  module Adapters
    class Organization

      SHELTER_ATTS = [
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
        @data = {
          api_specific_data: {}
        }
        @shelter = shelter_obj
      end
      
      def atts_to_hash
        SHELTER_ATTS.each do |att|
          @data[att] = @shelter.send(att)
        end
        @data[:last_updated_at] = Time.zone.now
        @data[:api_specific_data][:pf_id] = @data.delete(:id)
        @data[:zipcode] = @data.delete(:zip) if @data[:zip].present?
        @data
      end

    end
  end
end
