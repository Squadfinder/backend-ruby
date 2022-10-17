class RawgSearchFacade

  def self.get_name(name)
    data = RawgSearchService.get_name(name)[:results].map do |info|
      RawgSearch.new(info)
    end
  end
end
