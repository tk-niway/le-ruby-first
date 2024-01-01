# Description: Dynamic method generator
class DynamicGenerator
  (1..5).each do |num|
    define_method "dynamic_method_#{num}" do
      puts "Dynamic Method #{num}"
    end
  end
end

obj = DynamicGenerator.new
obj.dynamic_method_1
obj.dynamic_method_4