require 'rails_helper'

describe PetfinderService::Queries::OrganizationPets do

  describe '.initialize' do

    it "should raise an exception if Shelter ID is not present" do
      expect { described_class.new(pf_client, {}) }.to raise_exception(PetfinderService::Queries::Error)
    end
  end

  describe '#run' do
    
    it "should return an Array of animals associated with an organization" do
      VCR.use_cassette('pf_default_shelter_animals') do
        res = described_class.new(pf_client, id: pf_default_shelter_id).run
        expect(res.class.name).to eq('Array')
        expect(res.size).to eq(pf_default_limit)
        expect(res[0].class.name).to eq('Petfinder::Pet')
      end
    end
  end

end
