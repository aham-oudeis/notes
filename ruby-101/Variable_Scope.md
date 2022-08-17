Variable_Scope

<!-- Variable Scope -->

### Outer and inner scope

variables initialized inside a block has an _inner scope_

`for` , `while`, `untill`, `if`, `unless`, __do not__ create an inner scope.

that is, variables initialized inside `for` , `while`, `untill`, `if`, `unless` are accessible outside; actually, since they don't create an inner scope, it is a bit misleading to talk in terms of outside and inside. 

But, blocks that are passed in as argument to method calls do create an inner scope. While the variables initialized in inner scope are not accessible outside, the variables initialized outside are accessible inside __unless__ variable shadowing comes into play. 

```ruby
a = 'something'

loop do
  a = 'nothing'
  break
end

p a # ==> 'nothing'
```

Here, the variable `a` is initalized in the outer scope to a string object with value 'something'. This `a` is accessible from the inner scope defined by the block that is passed to the `loop` method. In the inner scope the variable is reassigned to a new string object 'nothing'. Before, `a` pointed to a string object `something`; after the reassignment, `a` points to another string object `nothing`. To see this, we can do the following:

```ruby
a = 'something'
p a.object_id

loop do
  a = 'nothing'
  break
end

p a # ==> 'nothing'
p a.object_id
```

The object_id of `a` before the loop and after the loop must be different. 

However, things would be different, if we had modified the original string object.

```ruby
a = 'something'
p a.object_id

loop do
  a.replace 'nothing'
  break
end

p a # ==> 'nothing'
p a.object_id
```

In this case, the object_id of  `a` must be the same before and after the loop. The reason for this is that inside the loop, we called the method `replace` on the string object that `a` pointed to. This method mutates the object by putting new value in the string object that `a` was originally pointing to. 

Same goes with other cases:

```ruby
a = 'boom'
loop do
  a = a.upcase # reassignment
  break
end
p a # => "BOOM"
```

```ruby
a = 'boom'
5.times do |num|
  a << '!'    # mutating the string object
end
p a # => "boom!!!!!"
```

or, adding a bit more complexity

```ruby
a = 'something'
(0..9).each do |num|
  num.odd? ? a << '!': a.prepend('!') # mutating the string object
end
p a # => "!!!!!something!!!!!"
```

### Variable Shadowing

But once we add the issue with variable shadowing, things change a bit. For example:

```ruby
a = 'something'
('a'..'i').each do |a|
  print a + "\t" 
  a = a + '!'
  puts a
end
p a 
```

In this example, we iterate through an enumerator containing letter 'a' to 'i' and in each iteration the variable `a` (the parameter used in invoking `each` method) points to the element passed to it and the block is run. The block first prints what  `a`  points to, then reassigns a new value to `a`. Finally, it puts the value of a. This happens for each element passed to the block. 

Since inside the block `a` is used as a parameter, the variable `a` initialized in the outer scope is no longer available. Hence, once we exit the loop, we are in the outer scope, where the variable `a` points to the same string object as was initialized before the loop started. This demonstrates variable shadowing. 

### Method Definition

Method definition has a self-contained scope. The method definition cannot access  local variable in another scope. Take an example here:

```ruby
a = 'something'
def some_method(var)
  puts var + a
end

some_method(a)
# Throws an error because a is not available 
# within the method body. It says: 
# "undefined local variable or method `a' for main:Object"
```

A bit more interesting example using 'variable as pointers'

```ruby
a = 'something'
def some_method(var)
  var = var.upcase
  puts var
end

some_method(a)
p a # => 'something'
```

Unlike the case of blocks that are able to reassign the variable from the inner scope, method definition cannot do so. Here, we define a method with a parameter `var` and we reassign the variable `var` to a new string object produced by calling `upcase` method on what `var` points to. 

When we pass `a` as an argument, initially both `var` and `a` point to the same string object `'something'` but then `var` points to the string object that is returned when we call `upcase` method on `'something'`. Then on, the string object that `a` points is no longer available within the methd body. 

Bascially, we cannot reassign the variable initialized outside the method, because method definition cannot access __variables__ initialized in a different scope.  

However, we can alter the object that the variable points to:

```ruby
a = 'something'

def some_method!(var)
  var.upcase!
  var << '!!!'
end

some_method(a)
p a # => "SOMETHING!!!!"
```

That is, although the method cannot change what the variable points to, it can mutate the object it points to, provided we passed the object to the method as an argument. 

That means, method definition can access __objects__ passed in.

It gets a bit more complicated when we define a method that can take a block as an argument. `map` is one such method that can access the return values of the block passed to it. Since blocks can access local variables, a method can somehow interact with the local variables used in the block. (I am a bit unclear on this issue.)

Things are slightly different with CONSTANTS, which are accessible from within a method definition. 