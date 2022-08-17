# what are collaborator objects?
Collaborator objects are objects that are part of another object's state. Basically, whatever is stored in the instance variable of an object is a collaborator object.

# relation to OOP
* it allows us to create these custom objects that have certain relationships with other objects
* enables us to model real-world relationships in a flexible way

# Example
```ruby
class Student
end

class Faculty
end

class Course
  attr_reader :name, :faculty, :students

  def initialize(name, faculty)
    @name = name
    @faculty = faculty
    @students = []
  end

  def enroll(student)
    @students << student
  end
end

peter = Faculty.new

molly = Student.new

math101 = Course.new("Intro to Calculus", peter)

math101.enroll(molly)

p math101.students
```

Here, `peter` a `Faculty` object and `molly` a `Student` object are collaborator objects of `math101` object.