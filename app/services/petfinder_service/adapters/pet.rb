module PetfinderService
  module Adapters
    class Pet
      
      PET_ATTS = [
        :id, 
        :name, 
        :animal, 
        :mix, 
        :age, 
        :shelter_id, 
        :shelter_pet_id,
        :sex, 
        :size, 
        :description, 
        :last_update, 
        :status, 
        :contact,
        :photos,
        :breeds
      ]

      def initialize(pet_obj)
        @data = {
          api_specific_data: {}
        } 
        @photos = []
        @pet = pet_obj
      end

      def atts_to_hash
        PET_ATTS.each do |att|
          if att == :photos
            @pet.photos.each do |photo_obj|
              @photos << PetfinderService::Adapters::PetPhoto.new(photo_obj).atts_to_hash
            end
            next end
          @data[att] = @pet.send(att)
        end
        @data[:last_updated_at] = Time.zone.now
        @data[:api_specific_data][:pf_id] = @data.delete(:id)
        @data[:breed_names] = @data.delete(:breeds)
        if @data[:shelter_id].present?
          @data[:api_specific_data][:pf_shelter_id] = @data.delete(:shelter_id)  
        end
        if @data[:shelter_pet_id].present? 
          @data[:api_specific_data][:pf_shelter_pet_id] = @data.delete(:shelter_pet_id)
        end
        @data[:photos] = @photos
        @data
      end

    end
  end
end
