class RawgSearch
  attr_reader :name, :platforms, :image, :genres, :game_id

  def initialize(data)
    @game_id = data[:id]
    @name = data[:name]
    @platforms = platform(data)
    @image = data[:background_image]
    @genres = data[:genres].map {|data| data[:name]}
  end

  def platform(data)
    platform = data[:platforms].map {|platform| platform[:platform]}
    games = platform.map {|info| info[:name]}
  end

end
