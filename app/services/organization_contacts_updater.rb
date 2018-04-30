class OrganizationContactsUpdater
  include LocalHelpers
  
  def initialize(organization)
    @org = organization
  end

  def run!
    return true unless needs_update?
    @org.contacts.each do |contact|

    end
  end

  private

  def needs_update?
    @org.contacts.where("last_updated_at > ?", stale_date).count > 0
  end

end
