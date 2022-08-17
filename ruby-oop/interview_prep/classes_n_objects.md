# what are classes?
classes are outlines/blueprints for what the objects are made up of (state) and what they are able to do (behavior).Classes encapsulate behaviors. In other words, classes are data types and the classes we define are custom data types.

# what are objects?
Objects are instantiations of classes. They encapsulate state by storing values in the instance variables.

Object of the same class have the same behaviors but different state.

Different state in the sense that when we change the state of one object, it does not affect the state of another object. Because the instance variables that track the state are scoped at the object level.

# what's their relationship?
* classes provide behaviors for the objects
* objects are instantiations of classes

```ruby
class Student
  def initialize(name)
    @name = name
    @courses = []
    @balance = 0
  end

  def access_library
    "Taking you to the library portal"
  end
end

cory = Student.new("Cory Bisel")
tommy = Student.new("Tommy Glue")
p cory
p tommy

cory.access_library
tommy.access_library
# Here, cory and tommy carry different state, but they have
# access to the same behaviors.
```
