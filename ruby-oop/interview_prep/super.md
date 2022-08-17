# what is super?
`super` is a keyword that calls the method of the same name as the enclosing method higher up in the inheritance hierarchy and passes arguments as follows:

When `super` is called without arguments, it passes in all the arguments passed to the enclosing method.

when `super` is called with specified arguments, it passes in only the specified arguments.

when `super` is called without any arguments but with parenthesis, it calls the method without any arguments.

# Benefits
* extending the functionality of the subclasses
* DRY code

# Example of three use cases

```ruby
class People
  def initialize(name)
    super()
    @name = name
    @id = generate_id
  end

  def generate_id
    # implementation details on generating a unique id
  end
end

class Student < People
  def initialize(name)
    super
  end
end

class Faculty < People
  def initialize(name, tenure)
    super(name)
    @tenure = tenure
  end
end
```