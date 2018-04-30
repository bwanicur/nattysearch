class OrganizationUpdater
  include LocalHelpers

  def initialize(organization)
    @org = organization
  end

  def run
    return true unless needs_update?
    @org = @org.includes([:pets, :contacts])
    # call ExternalApiClient.new.organization to update organization
    # call the OrganizationPetsUpdater and pass it the org
    # call the OrganizationContactsUpdater and pass it the org
  end

  private
  
  def needs_update?
    @org.last_updated > stale_date
  end

end
