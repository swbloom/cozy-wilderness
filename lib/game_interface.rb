class GameInterface
  def initialize
    @prompt = '> '
  end

  def display_welcome
    puts 'Welcome to Cozy Wilderness'
    puts "Use n/s/e/w to move, 'quit' to exit"
  end

  def get_input
    print @prompt
    gets.chomp.downcase
  end

  def display_map(map, player)
    puts "\n#{map.draw(player.x, player.y)}"
  end
end