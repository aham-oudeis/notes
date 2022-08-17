# What are setter methods?

We know that in the following example the `name` method is a __getter__ method.

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end
```

Because the method is returning a reference to the object stored in the instancee variable. That means, if a method returns a reference to the instance variable, then it is a getter method. But it  is not necessary to return a reference to the instance variable for it to be a getter method.

Sometimes, we may want to customize our getter method and return only a copy of the reference. For example:

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name.clone
  end
end
```
This is also a getter method, not because the method is returning a reference to the instance variable, but a copy of the reference (value). Returning the value stored in one of the instance variable is sufficient for it to be a getter method.

Are there getter methods that do not return the value stored in the instance variables? Here, things get a bit tricky. If we do not allow getter methods to do more than return the value stored in the instance variable, we cannot have customized getter methods, because the customized getter methods tend to return something other than the value stored in the instance variable. They return some modification. However, if we allow getter methods to do more than just return the value stored in the instance variable, then getter methods become indistinguishable from other behaviors.

For example,the `ssn` method in the following example seems like a customized getter method.

```ruby
class Person
  def initialize(name)
    @name = name
    @ssn = ""
  end

  def ssn
    # converts '123-45-6789' to 'xxx-xx-6789'
    'xxx-xx-' + @ssn.split('-').last
  end
end
```

If the `ssn` method is a getter method, it would seem like the `name` method in the following case is also a getter method:

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name.to_s
  end
end
```

I am not sure on what grounds we can say that the `name` method is not a getter method.

If we accept that getter methods can be customized in various ways, then it is unclear what distinguishes a getter method from behavior.

For examples:

How about the following?
```ruby
class Person
  def initialize(name)
    @name = name
  end

  def name
    "I am #{@name}."
  end
end
```

How about the following?
```ruby
class Person
  def initialize(name)
    @name = name
  end

  def info
    "I am #{@name}."
  end
end
```

Are the `name` and `info` methods in the above example getter methods or behaviors? It's not obvious if there is a clear way of deciding.

What this means is that the strict distinction between *getters/setters* and *behaviors* does not hold up. This is a good reason to be skeptical about identifying **attributes** with getters and setters. Getters and setters are simply loose way of talking about specfic kind of behavior that the objects have.

__Attributes__ are values stored in the instance variables. It is sensible to talk about an object having certain attributes despite there not being any getters or setters. Getters are ways of exposing attributes.