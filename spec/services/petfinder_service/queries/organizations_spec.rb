require 'rails_helper'

describe PetfinderService::Queries::Organizations do 

  describe '#initialize' do
    
    it "should raise an error if location is not present" do
      expect { described_class.new(pf_client, location: nil) }.to raise_error(PetfinderService::Queries::Error)
    end

  end

  describe '#run' do

    it "should return an Array of shelters based on zipcode" do
      service = described_class.new(pf_client, location: default_zipcode)
      VCR.use_cassette 'default zipcode shelters query' do
        shelters = service.run
        expect(shelters.class.name).to eq('Array')
        expect(shelters.size).to eq(pf_default_limit)
        expect(shelters.first.id).not_to be_empty
      end
    end 

    it "should return an Array of shelters with limit" do
      service =  described_class.new(pf_client, location: default_zipcode, limit: 15)
      VCR.use_cassette('shelters query 15 limit', match_requests_on: [ :method, :uri, :query ]) do
        shelters = service.run
        expect(shelters.size).to eq(15)
      end
    end

    it "should return an Array of shelters given an offset and limit" do
      service = described_class.new(pf_client, location: default_zipcode, limit: 15)
      first_fifteen = nil
      VCR.use_cassette('shelters query 15 limit', match_requests_on: [ :method, :uri, :query ]) do
        first_fifteen = service.run
      end
      service = described_class.new(pf_client, location: default_zipcode, limit: 10, offset: 10)
      second_ten = nil
      VCR.use_cassette('shelters query 10 limit 10 offset', match_requests_on: [ :method, :uri, :query ]) do
        second_ten = service.run
      end
      expect(first_fifteen[10].id).to eq(second_ten[0].id)
      expect(first_fifteen[11].id).to eq(second_ten[1].id)
      expect(first_fifteen[12].id).to eq(second_ten[2].id)
      expect(first_fifteen[13].id).to eq(second_ten[3].id)
      expect(first_fifteen[14].id).to eq(second_ten[4].id)
    end
  end

end
