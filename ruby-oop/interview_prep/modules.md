# what are modules?
Modules are containers for classes, constants, behaviors, and modules themselves.

# Additional details
* unlike classes, we cannot create objects from modules
* unlike class inheritance, we can mixin multiple modules with a class.

# types of modules
* mixins
* namespacing
* module methods

```ruby
module Gymable
  def access_gym
    puts "You are now able to access the gym"
  end
end

class Student
  include Gymable
end

Student.new.access_gym
```

# Namespacing

```ruby
module Teachable
  class People
  end

  class Student < People
  end

  class Courses
  end
end

Teachable::Student.new
```

# Module methods

```ruby
module SchoolActivities
  def self.upcoming_events
  end
end

SchoolActivities.upcoming_events
```