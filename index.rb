class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
    puts "#{@name}さんが新しく生まれました!"
  end

  def introduce
    puts "Hi, my name is #{@name} and I'm #{@age} years old."
  end
end

person1 = Person.new("John", 20)
person2 = Person.new("Bob", 30)

person1.introduce
person2.introduce


class MyClass
  def self.class_method
    puts "これはクラスメソッドです。"
  end
end

MyClass.class_method

class Animal
  def speak
    puts "動物が泣きます。"
  end
end

class Dog < Animal
  def bark
    puts "わんわん!"
  end
end

class Cat < Animal
  def bark
    puts "にゃー!"
  end
end

class Duck < Animal
  def bark
    puts "ガーガー!"
  end
end

def animal_bark(animal)
  animal.bark
end

animal = Animal.new
animal.speak

dog = Dog.new
dog.speak
dog.bark

animal_bark(dog)
animal_bark(Cat.new)
animal_bark(Duck.new)

module Swimable
  def swim
    puts "泳いでいます。"
  end
end

class Fish < Animal
  include Swimable
end

class Human < Animal
  include Swimable
end

human = Human.new
fish = Fish.new
human.swim
human.speak
fish.swim

# Singleton pattern
class Singleton
  private_class_method :new, :clone, :dup

  def self.instance
    @instance ||=new
  end

  def some_method
    puts "シングルトンのメソッドが呼ばれました"
  end
end

singleton1 = Singleton.instance
singleton2 = Singleton.instance
# singleton3 = Singleton.new # newはプライベートメソッドになっているので呼び出せずにエラーになる

puts singleton1 == singleton2

singleton1.some_method
