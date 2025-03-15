require 'minitest/autorun'
require_relative '../lib/player'

class PlayerTest < Minitest::Test
  def test_player_initializes_with_given_position
    player = Player.new(0,0)
    assert_equal 0, player.x
    assert_equal 0, player.y
  end

  def test_player_moves_north
    player = Player.new(1, 1)
    player.move(:north)
    assert_equal 0, player.y
    assert_equal 1, player.x
  end

  def test_player_moves_south
    player = Player.new(1, 1)
    player.move(:south)
    assert_equal 2, player.y
    assert_equal 1, player.x
  end

  def test_player_moves_east
    player = Player.new(1, 1)
    player.move(:east)
    assert_equal 1, player.y
    assert_equal 2, player.x
  end

  def test_player_moves_west
    player = Player.new(1, 1)
    player.move(:west)
    assert_equal 1, player.y
    assert_equal 0, player.x
  end
end