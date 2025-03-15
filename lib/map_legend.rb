class MapLegend
  def initialize(terrain)
    @terrain = terrain
  end

  def draw
    @terrain.map { |name, symbol| "#{symbol}: #{name.to_s.capitalize}" }.join("\n")
  end
end