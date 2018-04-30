require 'rails_helper'

describe PetfinderService::Results do

  describe '#run' do
  
    it "should identify and process Petfinder Shelter data" do
      VCR.use_cassette('pf_default_zipcode_shelters_query') do
        res = PetfinderService::Queries::Organizations.new(pf_client, location: default_zipcode).run
        processed_res = described_class.new(res).run
        expect(processed_res.class.name).to eq('Array')
        expect(processed_res.first.class.name).to eq('Hash')
        hash = processed_res.first
        expect(hash[:name]).to be_present
        expect(hash[:last_updated_at]).to be_present
        expect(hash[:api_specific_data][:pf_id]).to start_with('CA') 
      end
    end

    it "should identify and process Petfinder Pet data" do
      VCR.use_cassette('pf_default_shelter_animals') do
        res = PetfinderService::Queries::OrganizationPets.new(pf_client, id: pf_default_shelter_id).run
        processed_res = described_class.new(res).run
        expect(processed_res.class.name).to eq('Array')
        expect(processed_res.first.class.name).to eq('Hash')
        hash = processed_res.first
        expect(hash[:name]).to be_present
        expect(hash[:last_updated_at]).to be_present
        expect(hash[:api_specific_data][:pf_id]).to be_present
        expect(hash[:api_specific_data][:pf_shelter_id]).to be_present
        expect(hash[:api_specific_data][:pf_shelter_pet_id]).to be_present
      end
    end

  end

end
