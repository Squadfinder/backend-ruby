require 'rails_helper'

describe RawgSearchService do
  context "class methods", :vcr do
    context "#members_by_state" do
      it "returns location in corddinits" do
        search = RawgSearchService.get_name('call of duty')
        expect(search).to be_a Hash
        expect(search[:results][0]).to have_key(:background_image)
        expect(search[:results][0]).to have_key(:platforms)
        expect(search[:results][0]).to have_key(:name)
        
        expect(search[:results][0][:background_image]).to be_a String
        expect(search[:results][0][:platforms]).to be_a Array
        expect(search[:results][0][:name]).to be_a String
      end
    end
  end
end
