class Platform
# needs to be able to determine where each point is. 2D array? How to link 
# across the inner arrays? look up how to manipulate these.
# 
    attr_reader :x_max, :y_max, :x_min, :y_min

    def initialize(x,y)
        @x_max = x
        @y_max = y
        @x_min = 0
        @y_min = 0
    end

    def to_s
      "Platform size: #{@x_max}, #{@y_max}"
    end
end

## how big am i? what's on the platform?



# 
class Rover 
  attr_reader :x, :y, :direction, :platform

  def initialize(x, y, direction, platform)
    @x = x
    @y = y
    @direction = direction
    @platform = platform
  end

  def left
    case @direction
    when "N" then @direction = "W"
    when "W" then @direction = "S"
    when "S" then @direction = "E"
    when "E" then @direction = "N"
    end
  end

  def right
    case @direction
    when "N" then @direction = "E"
    when "E" then @direction = "S"
    when "S" then @direction = "W"
    when "W" then @direction = "N"
    end
  end

  def move
    case @direction
    when "N" then @y += 1
    when "S" then @y -= 1
    when "E" then @x += 1
    when "W" then @x -= 1
    else puts "This move will cause the rover walk off the platform."
    end
  end

  # def move
  #   case @direction
  #   when "N" && (@y + 1) <= @platform.y_max then @y += 1
  #   when "S" && (@y - 1) >= @platform.y_min then @y -= 1             
  #   when "E" && (@x + 1) <= @platform.x_max then @x += 1
  #   when "W" && (@x - 1) >= @platform.x_min then @x -= 1
  #   else puts "This move will cause the rover walk off the platform."
  #   end
  # end
  ################## can't quite get this to work

  def to_s
    "#{@x} #{@y} #{@direction}"
  end
end

###################
puts "What are the platform maximum coordinates?"
plat_1 = gets.chomp.split
platform_1 = Platform.new(plat_1[0].to_i, plat_1[1].to_i) 

puts "What are the first rover's coordinates?"
rov_1 = gets.chomp.split
rover_1 = Rover.new(rov_1[0].to_i, rov_1[1].to_i, rov_1[2], platform_1)

puts "How would you like the first rover to move?"
rov_1_mov = gets.chomp.split(//)

puts "What are the second rover's coordinates?"
rov_2 = gets.chomp.split
rover_2 = Rover.new(rov_2[0].to_i, rov_2[1].to_i, rov_2[2], platform_1)

puts "How would you like the second rover to move?"
rov_2_mov = gets.chomp.split(//)

rov_1_mov.each do |mov|
  case mov
  when "L" then rover_1.left
  when "R" then rover_1.right
  when "M" then rover_1.move
  end
end

rov_2_mov.each do |mov|
  case mov
  when "L" then rover_2.left
  when "R" then rover_2.right
  when "M" then rover_2.move
  end
end

puts rover_1.to_s
puts rover_2.to_s

###################
# platform_1 = Platform.new(5, 5)
# rover_1 = Rover.new(1, 2, "N", platform_1)

# r_1_input = "LMLMLMLMM"

# r_1_input.split(//).each { |letter|
#   case letter
#   when "L" then rover_1.left
#   when "R" then rover_1.right
#   when "M" then rover_1.move
#   end
# }

# puts rover_1

# rover_1.move = "LMLMLMLMM"
# rover_2 = Rover.new(platform_1, 3, 3, "E")
# rover_2.move = "MMRMMRMRRM"

# movement(rover_1)
# puts rover_1.to_s


# input = gets.chomp
# input.each do |letter| end

