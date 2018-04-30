module PetfinderService
  class Client

    def initialize
      @pf_client = Petfinder::Client.new(ENV['PETFINDER_API_KEY'], ENV['PETFINDER_API_SECRET'])
    end 

    def search_organizations(options={})
      res = PetfinderService::Queries::Organizations.new(@pf_client, options).run
      PetfinderService::Results.new(res).run
    end

    def organization(pf_org_id)
      res = PetfinderService::Queries::Organization.new(@pf_client, pf_org_id).run
      PetfinderService::Results.new(res).run
    end

    def organization_pets(options)
      res = PetfinderService::Queries::OrganizationPets.new(@pf_client, options).run
      PetfinderService::Results.new(res).run
    end
  end 
end
