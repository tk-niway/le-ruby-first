#  frozen_string_literal: true

class APIWrapper
  def self.create_api_method(endpoint)
    define_method(endpoint.to_sym) do |params|
      puts "APIエンドポイント'#{endpoint}'にリクエストを送信:#{params.inspect}"
    end
  end

  create_api_method :users
  create_api_method :posts
end

api_client = APIWrapper.new
api_client.users({ page: 1 })
api_client.posts({ category: 'ruby' })

# Aliasを使用したメソッド
class MyClass
  def original_method
    puts 'Original method'
  end

  alias_method :backup_method, :original_method

  def modified_method
    puts 'Modified method'
  end
end

obj = MyClass.new
# obj.backup_method
# obj.original_method = :modified_method
# obj.backup_method
obj.backup_method
obj.original_method
obj.modified_method


# クラスメソッドを動的に追加
module MyExtension
  def extended_moethod
    puts "This  method is added through extension."
  end
end

class MyExClass
  extend MyExtension
end

MyExClass.extended_moethod


# モンキー・パンチ
class Array
  def custom_sum
    reduce(:+)
  end
end

arr = [1,2,3,4,5]
puts arr.custom_sum
