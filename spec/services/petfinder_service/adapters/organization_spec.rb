require 'rails_helper'

describe PetfinderService::Adapters::Organization do

  describe '#atts_to_hash' do

    it "should translate the appropriate values and delete the incompatible hash keys" do
      org_adapter = described_class.new(pf_shelter_double)
      hash = org_adapter.atts_to_hash
      expect(hash[:id]).to be_nil 
      expect(hash[:zipcode]).to eq('92172')
      expect(hash[:zip]).to be_nil
      expect(hash[:name]).to eq('Test Shelter')
      expect(hash[:last_updated_at]).to be
      expect(hash[:api_specific_data][:pf_id]).to eq('CA886')
    end

  end

end
