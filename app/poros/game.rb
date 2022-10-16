class Game
  attr_reader :id, :title, :image, :genres, :consoles

  def initialize(data)
    @id = data[:id]
    @title = data[:name]
    @image = data[:background_image]
    @genres = data[:genres]
    @consoles = data[:parent_platforms]
  end
end