class Game
  attr_reader :id, :title, :image, :genres, :consoles

  def initialize(data)
    @id = data[:id]
    @title = data[:name]
    @image = data[:background_image]
    @genres = data[:genres]
    @consoles = Game.get_console_names(data)
  end

  def self.get_console_names(data)
    consoles = []
    data[:parent_platforms].each do |platform|
      platform.each do |p|
      consoles << p[1][:name]
      end
    end
    consoles
  end

  def self.get_genres(data)
    
  end
end