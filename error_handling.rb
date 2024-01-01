def divide(x,y)
  result = nil
  begin
    result = x / y
  rescue ZeroDivisionError => e
    puts "エラーが発生しました: #{e.message}"
  ensure
    puts "処理が終了しました"
  end
  result
end

puts divide(8,4)
puts divide(8,0)


class CustomError < StandardError
  def initialize(message = "カスタムエラーが発生しました。")
    super(message)
  end
end

def raise_custom_error
  raise CustomError.new("初期値を上書き")
end

begin
  raise_custom_error
rescue CustomError => e
  puts "カスタムエラーです。: #{e.message}"
end
