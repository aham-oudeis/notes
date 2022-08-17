### attr_* methods

attr_* methods are prefered for their simplicity, but when there are other demands in place, we would have to use manual getter and setter methods. For instance, when we need to have a built-in customization for accessing and setting instance variables.

Say, `@title` is the instance variable for which we want to create a getter and a setter method.

`attr_reader :title` creates a getter method
`attr_writer :title` creates a setter method
`attr_acessor :title` creates both a getter and a setter method.

```ruby
class Course
  attr_reader :name
  attr_accessor :teacher

  def initialize(name, teacher)
    @name = name
    @teacher = teacher
    @students = []
  end

  def enroll(student)
    if students.size < 30
    	students << student
    else
      puts "Class full!"
    end
  end

  private

  attr_reader :students
end

```

Here we don't want the  students attribute to  be  accessible directly, while still being able to enroll student in the course.

Likewise, we may have a custom getter method for the name and teacher attribute so they they return only a copy of the value rather than the reference to the value.
###