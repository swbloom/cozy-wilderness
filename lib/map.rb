# frozen_string_literal: true

require 'colorize'
require 'yaml'
require_relative 'loaders'
require_relative 'map_legend'

class Map
  CORNER = "+"
  CELL_WIDTH = 4
  HORIZONTAL_BORDER = "-"
  VERTICAL_BORDER = "|"

  def initialize
    @grid = MapLoader.new.load_map('forest_clearing')
    @terrain = TerrainLoader.new.load_terrain
  end

  def passable?(x, y)
    max_x = @grid[0].length - 1
    max_y = @grid.length - 1
    
    x.between?(0, max_x) && y.between?(0, max_y)
  end

  def draw(player_x, player_y)
    output = []
    output << 'Forest Clearing'.bold
    output << draw_border
    @grid.each_with_index do |row, y|
      output << draw_map_row(row, y, player_x, player_y)
    end
    output << draw_border
    output << "\nLegend:".bold
    output << MapLegend.new(@terrain).draw
    output.join("\n")
  end

  def terrain_at(x, y)
    @grid[y][x]
  end

  private

  def draw_border
    (width = @grid[0].length * 2) + 2
    "#{CORNER}#{HORIZONTAL_BORDER * (width-2)}#{CORNER}".light_black
  end

  def draw_map_row(row, y, player_x, player_y)
    cells = row.each_with_index.map do |cell, x|
      if x == player_x && y == player_y 
        '@'.yellow.bold.ljust(CELL_WIDTH)
      else
        @terrain[cell].ljust(CELL_WIDTH)
      end
    end
    "#{VERTICAL_BORDER}#{cells.join(' ')}#{VERTICAL_BORDER}"
  end
end

