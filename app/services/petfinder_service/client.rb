module PetfinderService
  class Client

    def initialize
      @pf_client = Petfinder::Client.new(ENV['PETFINDER_API_KEY'], ENV['PETFINDER_API_SECRET'])
    end 

    def search_organizations(options={})
      res = PetfinderService::Queries::SearchOrganizations.new(@pf_client, options).run
      PetfinderService::Results.new.process_results(res)
    end

    def search_pets(options)
      res = PetfinderService::Queries::SearchPets.new(@pf_client, options).run
      PetfinderService::Results.new.process_results(res)
    end
  end 
end
