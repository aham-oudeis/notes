# what is self?
`self` is a keyword that references where Ruby is in the program or the calling object.

```ruby
puts self
# => main
# that means, Ruby is in the main object

class Student
  puts self
end
# => Student
# that means, Ruby is in the Student class
```

# what are two use cases of self?
1. in calling the setter methods from inside the class
    * in absence of the explict reference to the calling  object, Ruby will only initialize a local variable instead of calliing the setter method
2. in defining class or module methods

```ruby
class Student
  attr_reader :gpa

  def self.what_am_i?
    "I am a method defined for #{self} class"
  end

  def update_gpa(num)
    self.gpa = num
  end

  private

  attr_writer :gpa
end

p Student.what_am_i?
```