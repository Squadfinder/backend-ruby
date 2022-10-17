require 'rails_helper'

RSpec.describe RawgSearch, :vcr do
  it "is able to give me the list and test its getting the right information" do
    information = RawgSearchService.get_name('call of duty')
    current = RawgSearch.new(information[:results][0])

    expect(current).to be_a RawgSearch
    expect(current.image).to be_a String
    expect(current.name).to be_a String
    expect(current.platforms).to be_a Array
    expect(current.genres).to be_a Array
  end
end
