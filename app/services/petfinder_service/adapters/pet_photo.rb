module PetfinderService
  module Adapters
    class PetPhoto

      PHOTO_ATTS = [
        :id, 
        :large, 
        :medium, 
        :small, 
        :thumbnail, 
        :tiny
      ]

      def initialize(pet_photo_obj)
        @data = {}
        @pet_photo = pet_photo_obj
      end

      def atts_to_hash
        PHOTO_ATTS.each do |att|
          @data[att] = @pet_photo.send(att) 
        end
        @data[:idx] = @data.delete(:id)
        @data
      end
      
    end
  end
end
