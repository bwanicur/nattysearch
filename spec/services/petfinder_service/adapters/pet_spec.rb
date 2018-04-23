require 'rails_helper'

describe PetfinderService::Adapters::Pet do
  
  describe '#atts_to_hash' do
    it "should translate the data hash" do
      hash = described_class.new(pf_pet_double).atts_to_hash  
      expect(hash[:id]).to be_nil
      expect(hash[:last_updated_at]).to be
      expect(hash[:api_specific_data][:pf_id]).to eq(pf_default_pet_id) 
      expect(hash[:api_specific_data][:pf_shelter_id]).to eq(pf_default_shelter_id) 
      expect(hash[:breed_names].class.name).to eq("Array")
      expect(hash[:breed_names].first).to eq(pf_pet_double.breeds.first)
      expect(hash[:photos].class.name).to eq("Array")
    end
  end

end
