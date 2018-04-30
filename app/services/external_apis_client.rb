class ExternalApisClient

  def initialize
    @clients = [
      # we currently only support the Petfinder API
      PetfinderService::Client.new
    ]
  end

  def organization(external_ids_hash)
    data = {}
    @clients.each do |client|
      my_id = external_ids_hash[client.class.name]
      data[client.class.name] = client.organization(my_id)
    end
    data
  end


  def search_organizations(options)
    data = {}
    @clients.each do |client|
      data[client.class.name] = client.search_organizations(options)
    end
    data
  end

  def organization_pets(options)
    data = {}
    @clients.each do |client|
      data[client.class.name] = client.organization_pets(options)
    end
    data
  end

end
