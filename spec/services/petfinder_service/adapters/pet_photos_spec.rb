require 'rails_helper'

describe PetfinderService::Adapters::PetPhoto do 

  describe '#atts_to_hash' do
    it "should set the values in the hash for the different photo URLs and rename the id key to idx" do
      expect(pf_photo_double.id).to be
      res = described_class.new(pf_photo_double).atts_to_hash 
      expect(res[:id]).to be_nil
      expect(res[:idx]).to be_present
      expect(res[:thumbnail]).to be_present
      expect(res[:small]).to be_present
      expect(res[:large]).to be_present
      expect(res[:tiny]).to be_present
      expect(res[:medium]).to be_present
    end
  end

end
