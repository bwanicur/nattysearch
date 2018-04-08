require 'rails_helper'

describe PetfinderService::Adapters::Organization do
  
  let(:shelter_obj) do 
    double('Shelter',
      id: 'PF-ID-1', 
      name: 'Test Shelter',
      address1: '111 Test Street',
      address2: 'Apt 1',
      city: 'San Diego',
      state: 'CA',
      zip: '92107',
      country: 'USA',
      latitude: '-117.239571',
      longitude: '32.741947',
      phone: '619-111-1111',
      fax: nil,
      email: 'shelter@test.com'
    )
  end

  describe '#atts_to_hash' do

    it "should translate the appropriate values and delete the incompatible hash keys" do

      org_adapter = described_class.new(shelter_obj)
      hash = org_adapter.atts_to_hash
      expect(hash[:pf_id]).to eq('PF-ID-1')
      expect(hash[:id]).to be_nil 
      expect(hash[:zipcode]).to eq('92107')
      expect(hash[:zip]).to be_nil
      expect(hash[:name]).to eq('Test Shelter')

    end

  end

end
