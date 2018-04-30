require 'rails_helper'

describe PetfinderService::Queries::Organization do

  describe '.new' do
    it "should raise an exception if a Petfinder Shelter ID is not supplied" do
      expect { described_class.new(pf_client, nil) }.to raise_error(PetfinderService::Queries::Error)
    end
  end

  describe "#run" do
    it "should fetch a single Petfinder Shelter given a shelter id" do
      service = described_class.new(pf_client, pf_default_shelter_id)
      VCR.use_cassette('pf_default_shelter') do
        shelter = service.run
        expect(shelter.class.name).to eq("Petfinder::Shelter")
        expect(shelter.name).to be_present
        expect(shelter.id).to be_present
      end
    end
  end

end
