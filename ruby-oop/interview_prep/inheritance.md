# what  is inheritance?
When a class acquires behaviors either from anothe class or from modules, it's called inheritance. Often, inheritance is taken to mean only class inheritance and mixins are called composition. But in Ruby, we say there is a class inheritance and an interface inheritance (via mixins).

# benefits
* avoid duplication
* managing complexity

# types of inheritance?
-class inheritance: when a class acquires behaviors from another class: the parent class is called the superclass, and the child class is called a subclass.

```ruby
class People
end

class Student < People
end
```
Here the Student class inherits from people class.

-interface inheritance: when a class acquires behaviors from modules.

```ruby
module Gradeable
  def grade_exams
  end
end

class People
end

class Student < People
end

class Faculty < People
  include Gradeable
end
```
