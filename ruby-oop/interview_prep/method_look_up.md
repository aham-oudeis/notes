# What is method look up path?
the order of classes and/or modules that Ruby traverses in finding the method.

```ruby
class People
  def access_library
    puts "Taking you to the libary portal"
  end
end

class Student < People
  def access_library
    puts "Sending a vehicle to get you to the library."
  end
end

dor = Student.new

dor.access_library

p dor.class.ancestors
```
# what is its significance?
* method overriding