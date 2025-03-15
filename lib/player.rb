class Player
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def move(direction, map)
    new_x = @x
    new_y = @y
  
    case direction
    when :north then new_y -= 1
    when :south then new_y += 1
    when :east  then new_x += 1
    when :west  then new_x -= 1
    end
  
    if map.passable?(new_x, new_y)
      @x = new_x
      @y = new_y
      true
    else
      puts 'You cannot move in that direction.'
      false
    end
  end
end
