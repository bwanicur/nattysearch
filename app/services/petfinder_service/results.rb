module PetfinderService
  class Results

    def process_results(query_results)
    end

    private

    def process_shelter_data(shelters)
      res = []
      shelters.each do |shelter|
        res << PetfinderService::Adapters::Organization.new(shelter).atts_to_hash
      end
      res
    end

    def process_pet_data(pets)
      res = []
      pets.each do |pet|
        res << PetfinderService::Adapters::Pet.new(pet).atts_to_hash
      end
      res
    end

  end
end
