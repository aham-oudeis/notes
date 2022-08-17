## Explicit Blocks

> An explicit block is a block that gets treated as a named object -- that is, it gets assigned to a method parameter so that it can be managed like any other object -- it can be reassigned, passed to other methods, and invoked many times. To define an explicit block, you simply add a parameter to the method definition where the name begins with an & character.

For example:

```ruby
def greet(&block)
  puts "Hi!"
  block.call
end

greet {puts "Outputting from inside the block!" }
```

Here, `&` unary operator converts the block passed in to the method into a proc object, assigns it to the variable `block` and makes it available inside the method. That way, inside the method, we can invoke the `call` method on the proc object that `block` refers to.

Not only that, since `block` refers to a proc object, we can simply pass it around:

```ruby

def call_proc(some_proc)
  puts "Calling the passed proc object"
  some_proc.call
end

def greet(&block)
  puts "Hi!"
  call_proc(block)
end

p greet {puts "Outputting from inside the block!" }
```

1. Execution starts at line 32 with the `greet` method invocation with a block passed in.
2. Execution jumps to line 27 where `&` operator converts the block to a proc object and assigns it to the variable `block`.
3. Execution moves to liine 28 which outputs `Hi!`
4. Execution then moves to liine 29, where the method `call_proc` is invoked with `block` passed in as an argument.
5. Execution jumps to line 22 and the variable `some_proc` is assigned to the proc object passed to the `call_proc` on line 29.
6. Execution moves to line 23 and it outputs `Calling the passed proc object`
7. Execution them moves to line 24 and the proc object that `some_proc` references is called.
8. Execution jumps to line 32  and the code inside the block is run, outputting: `Outputting from inside the block!`
9. Execution moves back to line 24, returning `nil`.
10. Executon jumps back to line 29, returning `nil`.