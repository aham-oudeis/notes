### Calling Setters and Getters

we call setters and getters on the objects just like any other method calls, writing the getter and setter method name after the dot operator.

Ruby offfers a nice syntax for the setter methods. While we define the setter methods as follows:

```ruby
def name=(name)
  @name = name
end
```

We can invoke the setter method in a much cleaner way:

```ruby
object.name = 'new name'
```

This is Ruby's syntactical sugar.

When we are calling the setter method from inside the class, we need to make sure that we are calling it on the object by prepending `self` to the setter name as follows:

```ruby
class Something
  attr_reader :name

  def change_name(new_name)
    self.name = new_name
  end

  private

  attr_writer :name
end
```
