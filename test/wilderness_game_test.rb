# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/wilderness_game'

class WildernessGameTest < Minitest::Test
  def test_unknown_command_shows_help_message
    game = WildernessGame.new

    output = capture_io do
      game.handle_command('blah')
    end

    assert_match(/Unknown command/, output.join)
  end

  def test_quit_command_returns_quit_symbol
    game = WildernessGame.new
    result = game.handle_command('quit')
    assert_equal :quit, result
  end

  def test_look_command_shows_surroundings
    game = WildernessGame.new

    output = capture_io do
      result = game.handle_command('look')
      assert_equal :continue, result
    end

    assert_match(/You find yourself in/, output.join)
  end

  def test_map_command_shows_basic_map
    game = WildernessGame.new

    output = capture_io do
      result = game.handle_command('map')
      assert_equal :continue, result
    end

    output_text = output.join
    assert_match(/Forest Clearing/, output_text)
    assert_match(/@/, output_text) # Should show player position
  end
end
