class Game
  attr_reader :id, :name, :background_image, :genres, :parent_platforms

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @background_image = data[:background_image]
    @genres = data[:genres]
    @parent_platforms = data[:parent_platforms]
  end
end