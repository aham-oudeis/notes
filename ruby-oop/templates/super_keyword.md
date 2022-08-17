### Super keyword

> When you invoke `#super` within a method, Ruby looks in the inheritance hierarchy for a method with the same name.

It seems like inheritance heirarchy is understood to exclude the class itself. If the super were to start calling method from the class itself, it would run into problems. It seems better to be explict that `super` invokes the enclosing method in the superclass. But this is a rather minor issue to make fuss about.

`super` works as if it is a method invocation. It invokes a method with the same name as the enclosing method, from the inheritance hierarchy.

`super` without parenthesis invokes a method with the same name as the enclosing method, from the inheritance hierarchy, and passes in all the arguments passed to the enclosing method.

`super` with parenthesis but no arguments invokes a method with the same name as the enclosing method, from the inheritance hierarchy, and passes no arguments.

`super` with specified arguments invokes a method with the same name as the enclosing method, from the inheritance hierarchy, and passes in only the specificied arguments.

if we run the following code, we will get an error, because
1. we are passing in three arguments to the `new` method
2. the `new` method creates a Dog object and calls the `initialize` method on that object with all three arguments passed in to the `initialze` method.
3. the super keyword inside the `initialize` method calls the `initialize` method from the superclass `Pet` and passes in all three arguments.
4. since the `initialize` method in the `Pet` class is defined to take only two arguments, it throws an error complaining about the wrong number of arguments.

```ruby
class Pet
  def initialize(name, color)
    @name = name
    @color = color
  end

  def speak
    "#{@name.capitalize} says "
  end
end

class Dog < Pet
  def initialize(name, color, breed="Unknown")
    super
    @breed = breed
  end
end

tango = Dog.new('Tango', "Brown", "Chihauha")
```
However, if we change the code and pass in only two arguments via the super keyword to the `initialize` method from the `Pet` class, the code works:


```ruby
class Pet
  def initialize(name, color)
    @name = name
    @color = color
  end
end

class Dog < Pet
  def initialize(name, color, breed="Unknown")
    super(name, color)
    @breed = breed
  end
end

tango = Dog.new('Tango', "Brown", "Chihauha")
```

```ruby
class Pet
  def moves
    "#{self.class} is moving "
  end
end

class Dog < Pet
  def moves(speed)
    super() + "#{speed}."
  end
end

Dog.new.moves("awkwardly")
```