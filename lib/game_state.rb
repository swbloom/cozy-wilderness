require_relative 'map'
require_relative 'player'

class GameState
  attr_reader :map, :player

  def initialize
    @map = Map.new
    @player = Player.new(0, 0)
    @running = true
  end

  def running?
    @running
  end

  def stop
    @running = false
  end

  def move_player(direction)
    @player.move(direction, @map)
  end

  def current_terrain
    @map.terrain_at(@player.x, @player.y)
  end
end
