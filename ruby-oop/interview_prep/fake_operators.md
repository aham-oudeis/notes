# fake operators
method calls that look like operators are  the fake operators.

For instance:

```ruby
1 + 1

# here '+' looks like an operator, but it is just a method call
# defined in the Integer class.
```

We can implement fake operators for our custom objects based on the need:

```ruby
class Course
  attr_accessor :students

  def initialize(teacher)
    @teacher = teacher
    @students = []
  end

  def enroll(student)
    students << student
  end

  def +(other)
    all_students = students + other.students
    new_course = Course.new(@teacher)
    new_course.students = all_students
    new_course
  end
end

phil101 = Course.new("Ibn")
phil102 = Course.new("Ibn")

phil101 + phil102
```

