###  self

1. `self` in calling a setter method from inside the class
2. defining class or module methods

-   [Calling methods with self](https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1#callingmethodswithself)

> We're required to use `self` so that Ruby knows the difference between initializing a local variable and invoking a setter method.

We use `self` to call the setter methods from inside the class, because in absence of the `self` Ruby does not know whether we meant to call the setter method or just initialize a local variable.

```ruby
class Something
  attr_accessor :name

  def change_name(new_name)
    self.name = new_name
  end
end

cup = Something.new("teacup")
cup.change_name("coffeecup")
cup.name # => "coffeecup"
```

-   [More about self](https://launchschool.com/books/oo_ruby/read/classes_and_objects_part2#moreaboutself)

We also use `self` to define the class methods (or, rather the methods in the singleton_class.)

`self` is a way of being explicit about the calling object.

`self` references where Ruby is in the program execution or what the calling object is.

```ruby
class Something
  def self.what_am_i?
    puts "I am the Something class"
  end
end

Something.what_am_i?
# => "I am the Something class"
```