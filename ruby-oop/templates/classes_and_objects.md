### Classes and Objects

Classes are outlines for what the objects are made up of (state) and what they are able to do (behaviors).

Objects are instantiations of classes. They have state and behaviors.

Classes provide behaviors for objects and the objects carry their state with them.

Objects are created from classes when we invoke the `new` class method. Since the `new` class method internally triggers the `initialize` method and relays all its arguments to it, we have to pass in adequate number of arguments to the `new` method invocation, depending on how many arguments the `initialize` method expects.

Classes and objects is how Ruby implements encapsulation. In addition to encapsulation, objects allow programmers to think on a new level of abstraction, given that objects can be conceived of as real world nouns with behaviors.

Example:

```ruby
class Person
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def write
    puts  "I am writing"
  end
end

dostoyevsky = Person.new("Fyodor", "Dostoyevsky")
dostoyevsky.write
```

In this example, `dostoyevsky` is a `Person` object. The `Person` class makes thee behavior `write` available to `dostoyevsky` such that we can invoke the `write` method on it.