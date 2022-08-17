## Procs

Procs are objects of Proc class. They are of two kinds: procs and lambdas. Procs are how Ruby implements closure in the sense of objects that can be passed around. Just like blocks, procs retain a memory of the environment they were created in, such that they can access and even change the variables that  were in scope when they were created.

```ruby
name = "Grace"

change_name_proc = proc {name = "Lily"}

def test(proc)
  puts "Executing the proc...."
  proc.call
end

puts "Name before we execute the code inside the proc: #{name}"
# => Name before we execute the code inside the proc: Grace

test(change_name_proc)

puts "Name after we execute the code inside the proc: #{name}"
# => Name before we execute the code inside the proc: Lily
```

In line 8 we create a `Proc` object inside which we reassign the value of the local variable `name` to `"Lily"`. But this code is simply encapsulated in a proc. Since we create the `chang_name_proc` after we have initialized the local variable `name`, the proc object retains a memory of its environment.

When we pass the `chang_name_proc` to the test method and execute the code by calling the `call` method on the proc, it executes inside the block in the context of its original environment. It reassigns the local variable to `"Lily"`. Hence, the value of the local variable `name` changes from `"Grace"` to `"Lily"`.

Just to illustrate the point with a bit of a wrinkle introduced, we can add another `name` local variable inside of the `test` method and the proc would still use the value from the original environment.

```ruby
name = "Grace"

change_name_proc = proc {puts "My name inside the proc: #{name}"; name = "Lily"}

def test(proc)
  name = "Faker"
  puts "Executing the proc...."
  proc.call
  puts "My name inside the method: #{name}"
end

puts "Name before we execute the code inside the proc: #{name}"
# => Name before we execute the code inside the proc: Grace

test(change_name_proc)
#=> Executing the proc....
#=> My name inside the proc Grace
#=> My name inside the method: Faker

puts "Name after we execute the code inside the proc: #{name}"
```

### Returning Procs

Procs are also useful becauase they can be returned by methods like any other object. Hence, we can create different kinds of procs to suit our purposes by having a function return a proc.

```ruby

def power_of(num)
  proc { |n| n ** num }
end

square = power_of(2) # => returns a proc that works as a way of squaring a number
cube = power_of(3) # => returns a proc that works as a way of cubing a numb

p square[5] # => 25
p cube[5] # => 125
```