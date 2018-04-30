class OrganizationPetsUpdater
  include LocalHelpers

  class OrganizationPetsUpdaterError < StandardError
  end

  def initialize(organization)
    @org = organization
  end

  def run!
    return true unless needs_update?
    # TODO: go fetch API data
    @org.pets.each do |pet|
      # TODO: update or create Pet record in our DB 
      # don't forget to set the last_updated_at :)
    end
  end
  
  private

  def needs_update?
    @org.pets.where("last_updated_at > ?", stale_date).count > 0 || @org.pets.count == 0
  end

end
