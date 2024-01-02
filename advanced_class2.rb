class CodeGenerator
  def generate_class(class_name)
    class_code = <<-CODE
      class #{class_name}
        def greet
          puts "Hello from #{class_name}!"
        end
      end
    CODE

    Object.class_eval(class_code)
    Object.const_get(class_name)
  end
end

generator = CodeGenerator.new
dynamic_class = generator.generate_class("DynamicClass")
obj = dynamic_class.new
obj.greet