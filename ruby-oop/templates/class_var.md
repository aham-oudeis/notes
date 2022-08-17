## Class Variable

Class variables are scoped at the class level and the same variable is shared among the class, the subclasses, and the objects instantiated from them.

Unlike instance variables, uninitialized class variables throws an error.

```ruby

class Something
  @@class_var = "Class variable from Something"

  def self.test
    @@class_var
  end
end

p Something.test

class SomeSpecificThing < Something
  @@class_var = "Class variable from Some Specific Thing"
end

p Something.test

class AnotherSpecificThing < Something
  @@class_var = "Class variable from Another Specific Thing"
end

p AnotherSpecificThing.test

p Something.test
```