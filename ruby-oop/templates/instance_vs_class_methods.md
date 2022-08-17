### Instance methods vs. class methods

Instance methods are methods we can invoke on the objects and class methods are methods we can invoke on the class.

Instance methods have access to the instance variables and can also access class variables.

Instance methods are how we expose the information about the state of the object.

Inside of the class we define class methods by adding `self.` before the method name. What this does is create a singleton class for the class object and puts the method there. That is why we can simply open the singleton class and put the 'class' methods there just as we put instance methods.

```ruby
# Here is an example of how we define the class method and how we call it

class Something
  def self.name
    "This is something."
  end
end

p Something.name
```

###