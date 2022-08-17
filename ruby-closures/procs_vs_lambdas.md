## Procs vs. Lambdas

Differences between procs and lambdas: while procs are more like blocks, lambdas are more like methods
1. procs, like blocks, have lenient arity, lambdas and methods have strict arity
2. `return` inside of procs returns from the context they were created in; if the context of their creaton is inside of a method, then it returns from that context; lambdas only return from the block

### Difference in Arity
```ruby
juxtapose = proc { |x, y| "#{x} #{y}" }
p juxtapose[2]
# => "2 "

juxtapose = proc { |x, y| "#{x} #{y}" }
p juxtapose[2, 3, 4]
# => "2 3"

# But
juxtapose = lambda { |x, y| "#{x}  #{y}" }
p juxtapose[2]
# => ArgumentError: Wrong number of arguments

juxtapose = lambda { |x, y| "#{x}  #{y}" }
p juxtapose[2, 3, 4]
# => ArgumentError: Wrong number of arguments
```

### Difference in Return

```ruby
def test
  name = "Grace"
  puts "Creating proc inside a method..."
  test_return = proc { return name }
  puts "Executing proc...."
  test_return.call
  puts "My name inside the method: #{name}"
end

name = "Stranger"

puts "Name outside of the method: #{name}"
# => Name before we execute the code inside the proc: Grace

test()
# Creating proc inside a method...
# Executing proc....
# (with proc the last line is skipped, bc proc returns)

puts "This line is after the proc return."
#=> This line is after the proc return.
puts "Name outside of the method after proc call: #{name}"
#=> Name outside of the method after proc call: Stranger
```

```ruby
def test
  name = "Grace"
  puts "Creating proc inside a method..."
  test_return = lambda { return name }
  puts "Executing proc...."
  test_return.call
  puts "My name inside the method: #{name}"
end

test()
# Creating proc inside a method...
# Executing proc....
# My name inside the method: Grace (This line is skipped by proc)

puts "This line is after the proc call inside of a method."
#=> This line is after the proc call inside of a method.
```

This shows that `return` inside of a proc returns from the environment it was created, i.e, the method, but `return` inside of a `lambda` returns only from the inner scope.

This causes a rather strange problem, when we try to return from the `main` scope. For example:

```ruby
name = "Grace"

change_name_proc = proc { loop {return name}; name = "Lily"}

def test(proc)
  puts "Executing the proc...."
  proc.call
  puts "This is outputted because we used lambda."
end

puts "Name before we execute the code inside the proc: #{name}"
# => Name after we execute the code inside the proc: Grace

test(change_name_proc)
#=> Executing the proc....
#=> (Proc returns from the enclosing method and hence the last line
# inside the method is not executed.) Not surprising. But...

# This is quite weird, but even the following line is not executed
# The execution gets kicked out of the existing scope, i.e., the `main`;
# since `main` is the most basic level, it throws an error in coderpad
# but in irb, it exits the program and does not execute any other code.
puts "This line does not get executed because proc attempts to return from the main scope."
```