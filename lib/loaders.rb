class MapLoader
  def load_map(map_name)
    config_path = File.join(File.dirname(__FILE__), '..', 'config', 'maps.yml')
    maps = YAML.load_file(config_path)
    maps[map_name].map { |row| row.map(&:to_sym) }
  end
end

class TerrainLoader
  def load_terrain
    config_path = File.join(File.dirname(__FILE__), '..', 'config', 'terrain.yml')
    terrain_config = YAML.load_file(config_path)
    terrain_config.transform_keys(&:to_sym).transform_values do |terrain|
      terrain['symbol'].send(terrain['color'])
    end
  end
end