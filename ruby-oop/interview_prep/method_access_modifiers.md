# method access modifiers
* ways of building different levels of access to the instance methods
* public, private, protected

# related concepts
* method access modifiers enables further encapsulation

# example
```ruby
class Student
  def initialize(name)
    @name = name
    @courses = []
  end

 attr_reader :name, :courses
 attr_accessor :gpa
end

cory = Student.new("Cory Turner")
p cory.name
p cory.gpa

cory.gpa = 4.0

p cory.gpa
```

By default, instance methods are public (except for the `initialize` method). `public` instance methods comprise the public interface of the class. that is, we can invoke those methods explicitly on the object.

But we can restrict access to certain methods so that they cannot be  be called with an explicit caller.

```ruby
class Student
  attr_reader :name, :courses, :gpa

  def initialize(name)
    @name = name
    @courses = []
  end

  private

  attr_writer :gpa
end

cory = Student.new("Cory Turner")
p cory.gpa = 4.0
```
The code throws an error because the getter method for `gpa=` is private.

But they can be called from within the class. For convenience, let's make `name` method private.

```ruby
class Student
  def initialize(name)
    @name = name
    @courses = []
  end

 def info
  "Name: #{name}"
 end

 private

 attr_reader :name, :courses

 attr_accessor :gpa
end

cory = Student.new("Cory Turner")
p cory.info
```

We can call the `name` method from the `info` method.

There is one more modifier: `protected`

```ruby
class Student
  attr_reader :name, :courses

  def initialize(name)
    @name = name
    @courses = []
  end

  def info
    <<~MSG
    Name: #{name}
    GPA: #{gpa}
    MSG
  end

  def update_gpa(num)
    self.gpa = num
  end

  def same_gpa_as(other)
    gpa == other.gpa
  end

  protected # if this were to be private, the folloing code would throw  an error

  attr_accessor :gpa
end

cory = Student.new("Cory Turner")
cory.update_gpa(4.0)

nir = Student.new("Niraj Kafle")

nir.update_gpa(3.9)

cory.same_gpa_as(nir)
```