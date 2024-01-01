def quack(object)
  # If the object has a quack method, call it
  object.respond_to?(:quack) ? object.quack : object.beep
end

class Duck
  def quack
    puts "Quack!"
  end
end

class Robot
  def beep
    puts "Beep beep quack!"
  end
end

mallard_duck = Duck.new
robot_duck = Robot.new

quack(mallard_duck)
quack(robot_duck)