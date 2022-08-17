###  Collaborator objects

Collaborator objects are objects that are part of the state of another object.

Collaborator objects enable programmers to work with custom-objects and to model real-world relationships between objects.

```ruby
class Faculty
  def initialize(name)
    @name = name
  end
end

class Course
  def initialize(name, teacher)
    @name = name
    @teacher = teacher
    @students = []
  end
end

krishna = Faculty.new("Mulla Krishna")
phil = Course.new("Philosophy", krishna)
```

In this example, we define a `Faculty` class and a `Course` class in a way that a `Faculty` object has one instance variable, and a `Course` object has three instance variables.

We then instantiate a `Course` object `phil`. The instance variable `@name` of `phil` stores a string. In this sense, the string object is a collaborator object of `phil`.

Likewise, we store an array object in the instance variable `@students`. In that case, the array object would be the collaborator object of `phil`.

Likewise, the `Faculty` object stored in the instance variable `@teacher` is also the collaborator object of `phil`.


