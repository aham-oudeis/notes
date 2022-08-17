## Modules

Modules are containers for behaviors and constants usable in other classes via mixin. Other than mixin, modules can be used for namespacing and as container for module methods. Overall, modules has three main use cases: (1) interface inheritancee, i.e., mixins, (2) namespacing, and (3) containers of module methods.

Since classes can inherit methods from modules but this kind of inheritaance is different from class inheritance, it is called interface inheritance.

Modules used as containers for common methods and constants are mixed in with classes using the following syntax: `include ModuleName`'', where `ModuleName` stands for the name of the module that is to be included. This usage of modules allow us to avoid code duplication by extracing common methods to a module and making them available to the class as per the need.
  **Benefits**
  1. Overcomes the limitation of single inheritance
  2. Allows for extracting behaviors that are not easily modeled using class inheritance, i.e., the heirarchical relationship.

```ruby
module Flyable
  def can_fly
    "I am a #{self.class}. I can fly."
  end
end

class Animal
end

class Mammal < Animal
end

class Bird < Animal
end

class Pigeon < Bird
  include Flyable
end

class Bat < Mammal
  include Flyable
end

class Penguin < Bird
end
```
Here, a Bat object can invoke the fly method that returns the string object: "I am a Bat. I can fly.", because it is made available through the use of mixin.

### NameSpacing

Namespacing means organizing similar classes under a module. It allows us to **recognize related classes in our code** and also **reduces the chances of name collision**.

```ruby
module TeachingSection

  module Persons
    class Person
      def initialize(name)
        @name = name
      end
    end

    class Faculty < Person
    end

    class TeachingAssistant < Person
    end
  end

  module Schools
    class ArtsNSciences
    end

    class Engineering
    end
  end
end

TeachingSection::Schools::ArtsNSciences.new # using namespace resolution operator
```

### Container for Module Methods

Modules as **Container** for module methods is used to put methods that may seem out of place in the code.

```ruby

module OddBehaviors
  def self.say_something_weird
    "This statement is false"
  end
end

puts OddBehaviors.say_something_weird
puts OddBehaviors::say_something_weird
```

