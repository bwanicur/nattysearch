require 'rails_helper'

describe PetfinderService::Queries::SearchOrganizations do 

  let(:pf_client) { Petfinder::Client.new(ENV['PETFINDER_API_KEY'], ENV['PETFINDER_API_SECRET']) }

  describe '#initialize' do
    
    it "should raise an error if location is not present" do
      expect { described_class.new(pf_client, location: nil) }.to raise_error(PetfinderService::Queries::Error)
    end

  end

  describe '#run' do

    let(:service) { described_class.new(pf_client, location: pf_default_zipcode) }

    it "should return an Array of shelters based on zipcode" do
      VCR.use_cassette 'default zipcode shelters query' do
        shelters = service.run
        expect(shelters.class.name).to eq('Array')
        expect(shelters.size).to eq(pf_default_limit)
        expect(shelters.first.id).not_to be_empty
      end
    end 
  end

end
