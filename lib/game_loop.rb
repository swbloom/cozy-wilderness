require_relative 'game_interface'
require_relative 'game_state'
require_relative 'commands'

class GameLoop
  def initialize
    @interface = GameInterface.new
    @state = GameState.new
  end
  
  def run
    @interface.display_welcome

    while @state.running?
      input = @interface.get_input
      if Commands.handle(input, @state) == :quit
        @state.stop
      end

      @interface.display_map(@state.map, @state.player)
    end
  end
end
