class MyClass
  def dynamic_method(action)
    puts "Performing #{action}"
  end
end

obj = MyClass.new

method_name = 'dynamic_method'

obj.send(method_name, "some action")
