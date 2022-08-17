### Inheritance

In Ruby, there are two kinds of inheritance: class inheritance and interface inheritance.

Class inheritance is when a class __inherits__ behavior from another class. The class that is inheriting behavior is called the __subclass__ and the class it inherits from is called the __superclass__.

We can use class inheritance to extract common behaviors from classes that share that behavior and move it to a superclass. Superclass is where we put behaviors with large useability; subclass is where we put more fine-grained, detailed behaviors. That means, inheritance is a way to implement the DRY principle. (Another being module.)

It's like having a lot of common behaviors between arrays and hashes in the enumerable module (that's interface inheritance), or in the Object class (class inheritance).

### Class inheritance

```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal # the class GoodDog inherits from the Animal superclass
end

class Cat < Animal
end

sparky = GoodDog.new #instantiaion of GoodDog class
paws = Cat.new #instantiaion of Cat class

puts sparky.speak #=> Hello
puts paws.speak #=> Hello
```

Here the sign `<` signifes the inheritance relation. `Cat < Animal` means the class `Cat` inherits all the methods (both instance methods and class methods) from the superclass `Animal`.

One of the significant limitations of class inheritance in Ruby is that one can subclass only from one superclass. This makes it difficult to accurately model some problem domain. When a class needs to acquire methods that are not made available by the superclass, but those methods are also applicable elsewhere in the code, single inheritance is unhelpful.

Some language allows for multiple inheritance. Ruby has mixins, i.e., interface inheritance, as a solution. While one can subclass from only one superclass, one can mixins as many modules as one needs.

Mixins allows one to extract common behaviors to a module and mixin with the class as per the need.

See [Modules](modules.md).