### Truthiness

In Ruby anything except `false` or `nil` evaluates as `true`. That means, a custom object with no attributes would be considered `truthy` but a reference to uninitialized instance variable would be `falsey`.

```ruby
class Something; end
empty_object = Something.new

empty_objet ? "Empty Object is Truthy" : "Empty Object is Falsey."

#=> "Empty Object is Truthy."

# one new thing from OOP is that uninitialized instance variables returns nil;
# so, if we happen to evaluate an uninitialized instance variable, then
# it would evaluate as false.

class Something
  attr_reader :name
end

empty_object = Something.new

puts "Uninitialized Instance variable is " +
    (empty_object.name ? "Truthy" : "Falsey.")

#=> "Uninitialized Instance variable is Falsey."
```
This is because, a reference to an uninitialized instance
variable `@name` returns nil and thus `empty_object.name`
evaluates as false.