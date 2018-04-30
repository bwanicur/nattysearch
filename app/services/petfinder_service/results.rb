module PetfinderService
  class Results

    def initialize(query_results)
      @results = query_results
    end

    def run 
      if @results.class.name == 'Petfinder::Shelter'
        process_shelter_data(@results)
      elsif @results&.first&.class.name == 'Petfinder::Shelter'
        process_shelters_data(@results)
      elsif @results&.first&.class.name == 'Petfinder::Pet'
        process_pet_data(@results)
      end
    end

    private

    def process_shelters_data(shelters)
      res = []
      shelters.each do |shelter|
        res << PetfinderService::Adapters::Organization.new(shelter).atts_to_hash
      end
      res
    end

    def process_shelter_data(shelter)
      PetfinderService::Adapters::Organization.new(shelter).atts_to_hash
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
