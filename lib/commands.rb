# frozen_string_literal: true

require_relative 'map'

module Commands
  def self.handle(input, state)
    command = DIRECTORY.fetch(input, UnknownCommand.new)
    command.execute(state)
  end

  class Command
    def execute(state)
      raise NotImplementedError, "#{self.class} must implement execute method"
    end
  end

  class QuitCommand < Command
    def execute(state)
      puts 'Goodbye!'
      :quit
    end
  end

  class MoveCommand < Command
    def initialize(direction)
      @direction = direction
    end

    def execute(state)
      state.move_player(@direction)
      :continue
    end
  end

  class HelpCommand < Command
    def execute(state)
      puts 'Available commands:'
      puts '- quit: Exit the game'
      puts '- help: Show this list of commands'
      puts '- look: Look around you'
      :continue
    end
  end

  class LookCommand < Command
    def execute(state)
      terrain = state.current_terrain
      puts "\nYou are standing on #{describe_terrain(terrain)}."
      state.display_map
      :continue
    end

    private

    def describe_terrain(terrain)
      case terrain
      when :grass then "soft grass"
      when :water then "shallow water"
      when :tree then "a patch of ground near a tall tree"
      when :mountain then "rocky ground"
      when :path then "a dirt path"
      end
    end
  end

  class UnknownCommand < Command
    def execute(state)
      puts "Unknown command. Type 'help' for available commands"
      :continue
    end
  end

  DIRECTORY = {
    'quit' => QuitCommand.new,
    'help' => HelpCommand.new,
    'look' => LookCommand.new,
    'n' => MoveCommand.new(:north),
    's' => MoveCommand.new(:south),
    'e' => MoveCommand.new(:east),
    'w' => MoveCommand.new(:west)
  }.freeze
end
