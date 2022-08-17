<!-- Local Variable Scope -->

#### Example 1

```ruby
a = “Hello”
b = a
a = “Goodbye”
puts a
puts b

```

The code outputs `Goodbye` and `Hello` and returns nil, because 

* on `line 4` we invoke `puts` method and pass in `a` as an argument.  `a` is initialized to the string object `'Hello'` in `line 1` and then reassigned to string object `Goodbye` in `line 3`. Since there is no further reassignment of `a`, `puts` method outputs `Goodbye` and returns `nil`
* on `line 4` we invoke `puts` method and pass in `b` as an argument. Since `b` is initialized to string object that `a` points to, i.e., `'Hello'`,  in `line 1`  and  there is no further reassignment of `b`, `puts` method outputs `Hello` and returns `nil`.
* Since the last expression `puts b` returns `nil`, the code returns `nil`. 

This demonstrates the concept of variables as pointers.



#### Example 2

```ruby
a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b
```



`line 9` outputs `5` and `line 10` throws an error, because

* in `line 9` we invoke the `puts` method and pass in the local variable `a` as an argument. The local variable `a` is initialized in `line 1` to the Integer object `4` but reassigned to the interger object `5` inside the block, which is passed in as an argument to the `loop` method call. The loop breaks after initializing the local variable `b` to the integer object `3`. Since there is no further reassignment of `a`, `line 9` outputs `5` and returns `nil`. 
* in `line 10` we invoke the puts on the local variable `b` ; since the variable initialized inside the block is not accessible outside the block, the program throws an error saying that the variable or method is not defined. 

This demonstrates the concept of variable scope, specially the idea that variables initialized outside the block is accessible inside the block but not vice versa. 

### Example 3

```ruby
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```

`line 10` outputs `3` and returns `nil` and `line 11` outputs `2` and returns `nil`, because

* in `line 1` the local variable `a` is initialized to the integer object `4`
* in `line 4` we invoke the `loop` method and pass in a block as an argument, within which we initialiize the local variable `c` to the integer object `3`  and reassign `a` to the object that `c` points to, i.e., `3`. The loop breaks. 
* since there is no further reassignment, `a` now points to `3`
* Hence, when we inovke the `puts` method and pass in `a` in `line 10`, it outputs `3` and returns `nil`.

And 

* In `line 2` the local variable `b` is initialized to `2` and since the variable is not reassigned, `b` till points to `2`. In `line 11` when we invoke the `puts` method and pass in `b` as an argument, it outputs `2` and returns `nil`. 

This demonstrates the concept of variable scope. In particular, it demonstrates the idea that local variables initialized outside the block are accessible from inside the block. 

### Example 4

```ruby
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')
```

On `line 10` we invoke the method `example` and pass in the string literal `'hello'` as an argument. It outputs `'hello'` three times and returns `nil`, because

* the method `example` is defined with a parameter `str`. When the `example` method is invoked in `line 10`, method parameter `str` points to the string object `'hello'`
* we initialize a local variable `i` to the integer object `3` and invoke the `loop` method
* This string object is passed in as an argument to the `puts` method call in line 4 within the block passed in as an argument to the `loop` method call. 
* the loop runs three times and breaks by reassigning the value of `i` to `i - 1`. 

This demonstrates the concept of variable scoping. In particular, it demonstrates the idea that within the method body the variables initialized outside the block is accessible inside the block. 

### Example 5

```ruby
def greetings(str)
  puts str
  puts "Goodbye"
end

word = "Hello"

greetings(word)
```

`line 8` outputs `'Hello'` and `'Goodbye'` and return `nil`, because

* in `line 6` we initialize the local variable `word` to the string object `'Hello'`
* in `line 8` we pass in the local variable `word` as an argument to the method call `greetings`
* since in `line 1-4` the method `greeting` is defined with a parameter `str`, when we invoke the method `greetings` with `word` as an argument, both the method parameter `str` and the local variable `word` point to the same string object `'Hello'`. 
* inside the method body, we invoke the `puts` method and pass in `str` as an argument. This outputs `Hello` to the console and returns nil.
* Next, we invoke the `puts` method and pass in `'Goodbye'` as an argument. This outputs  `'Goodbye'` and returns `nil`.

This demonstrates the concept of variable scope, in particular, the idea that local variables initialized outside the method are acccessible inside the method only if they are passed in as arguments.

### Example 6

```ruby
arr = [1, 2, 3, 4]

counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end 

puts "Your total is #{sum}"
```

 

`line 12` outputs `Your total is 10` and returns `nil`, because

* in `line 12` we invoke the puts method and pass in the string `"Your total is #{sum}"` with the string interpolation of the local varible `sum`. 
* in `line 1`, the local variable `arr` is initialized to the array object `[1, 2, 3, 4]`
* the local variable `counter` is initialized in `line 3` to `0` .
* the local variable `sum` is initialized in `line 4` to `0` .
* in `line 6` we invoke the `loop` method and pass in the `do..end` block within which we reassign the value of `sum` by adding each element of `arr`. 
* we break the loop when it is done iterating through the array `arr`
* At this point, the value of `sum` is `10`. 

This demonstrates the concept of variable scoping, especially, the idea that the local variable initialized outside the block is accessible inside the block. 



### Example 7

```ruby
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a
```

`line 7` outputs `"Bill"` to the console and returns the same string object, because

the local variable `a` initialized in `line 1`  to the string object `Bob` and `a` is  reassigned inside the block in `line 4` to the string object `"Bill"` This reassignment happens 5 times because the block is part of the `times` method invocation. Hence, in `line 7` the local variable `a` points to the string object `"Bill"` and since `a` is passed in as an argument to the `p` method invocation, it outputs  `"Bill"` to the console and returns the same string object.

This demonstrates the concept of variable scoping, in particular, the idea that local variable initialized outside the block is accessible inside the block.



<!-- Variable Shadowing -->

### Example 1

```ruby
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b
```

The code outputs `5`, `5`, `4`, `2` in that order and returns `nil`, because

1. in `line 4-7`, we invoke the method `times` on the integer object `2` and pass in the block with parameter `a`. Since the parameter shares the same name `a` with the local variable, the inner scope created by the block does not have access to the local variable `a` defined outside the block. Inside the block the local variable `a` is reassigned to the integer object `5` and it is output to the console two times. 
2. in `line 9` the local variable `a` is passed in as an argument to the method `puts`. Since the value of `a` is initialized to the integer object `4` in `line 1` and not reassigned later,  `a` retains the same value. Hence, `line 9` outputs `4` and returns `nil`
3. in `line 10` the local variable `b` is passed in as an argument to the `puts`  method. since the value of `b` is initialiized to the integer object `2` and is not reassigned later, it still points to the same object. Hence, `line 10` outputs `2` and returns `nil`. Since this is the last line of the code, the code returns `nil`. 

This demonstrates the concept of variable shadowing. In particular, the `line 4-5` shows an instance of variable shadowing, which implies that when the block parameter shares the same name as the local variable initialized outside the block, access to the local variable outside the block is prevented access inside the block. Hence, the value of `a` is not reassigned. 

### Example 2

```ruby
n = 10

1.times do |n|
  n = 11
end

puts n
```

This code outputs `10` to the console and returns `nil`, because

1. the local variable `n`  initialized in `line 1` to the integer object `10` is not reassigned later in the program.
2. the local variable `n` is passed in as an argument to the `puts` method
3. Hence, the output is `10` and return value is `nil`.

This demonstrates the concept of variable shadowing as instantiated in `line 3-4`. Since the block parameter `n` shares the same name as the local variable initialized in `line 1`, the latter is no longer accessible inside the block. When `n` is reassigned in `line 4`, this only changes what the parameter points to and does not affect the local variable `a` initialized in `line 1`. 

### Example 3

```ruby
animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal
```

The code returns `nil` because the last line is a `puts` method invocation with an argument `animal`. It outputs '"dog"', because the local variable `animal` is initialized to the string object `"dog"` in `line 1` and is not reassigned within the block. 

Although the `do..end` block in `line 3-6`  passed to the `loop` method call in `line 3` reassigns the local variable `animal` to `"cat"`, this reassignment does not affect the local variable initialized outside the scope, because the block parameter shares the same name `animal` with the local variable initialized in the outer scope.

This demonstrates the concept of variable shadowing. 



<!-- Object Passing / Variable as Pointers -->

### Example 1

```ruby
a = "hi there"
b = a
a = "not here"
```

The code returns the string object `"not here"`. It does not output anything. 

In `line 1` the local variable `a` is initialized to the string object `"hi there"`. In `line 2` the local variable `b` is initalized and points to string object that the local variable `a` points to. Then in `line 3` the local variable is reassigned to the string object `"not here"`. At this point local variable `a` and `b` point to two distinct string objects. Since the last line evaluates to `"not here"`, the same string is returned. 

This demonstrates the concept of variables as pointers. 

### Example 2

```ruby
a = "hi there"
b = a
a << ", Bob"
```

The code returns `"hi there, Bob"` and does not output anything, because the local variable `a` is initialized to the string object `"hi there"` and we call the `<<` method on `a` and pass in the string `", Bob"` as an argument. Since `<<` method is destructive, it mutates the caller by appending the argument to the caller, i.e, the string object "hi there"  is mutated to `"hi there, Bob"`. This what is returned. 

This demonstrates the concept of variables as pointers and mutating methods. 

### Example 3

```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq
```



In `line 1` the local variable `a` is initialized to the array object `[1, 2, 3, 3]`. In `line 2` the local variable `b` is initalized and assigned to the same object that `a` points to. In `line 3` the local variable `c` is initialized and assigned to the return value of calling the `uniq` method on the object  `a` points to; this method call  returns `[1, 2, 3]`. The `uniq` method is non-destructive and returns a new array object. It is this new array object that the local variable `c` points to. 

If the last line was `c = a.uniq!`, the object that `a` points to would be mutated to `[1, 2, 3]` and the local variable `c` points to this array. At this point, all three local variables `a`, `b`, and `c` point to the same mutated array `[1, 2, 3]`.

This demonstrates the concept of variables as pointers. 

### Example 4

```ruby
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)
```



`line 6` returns the following array:

`["I like the letter: a", "I like the letter: b", "I like the letter: c"]`

Because 

1. On `line 5` we initialize the local variable `a` to the array object `['a', 'b', 'c']` and on `line 6` we call the `test` method and pass in `a` as an argument. 
2. On `line 1-3` we define the `test` method with the parameter `b`. When we call the `test` method with `b` as an argument, both the parameter `b` and the local variable `a` points to the same array  `['a', 'b', 'c']` . 
3. Inside the method, in `line 2` we call the `map` method on `b` and pass the block `{|letter| "I like the letter: #{letter}"}`. `map` method iterates through the array and sends each element to the block and runs it. Since `map` method returns an array containing the values returned by the block and the `map` method call is the last evaluated expression in the `test` method body, `test(a)` returns `["I like the letter: a", "I like the letter: b", "I like the letter: c"]`. 

This demonstrates the concept of transformation, object passing, and non-mutating method. 

### Example 5

```ruby
a = 5.2
b = 7.3

a = b

b += 1.1
```

The code returns the float object `8.4` and does not output anything, because the local variable `b` is reassigned to the return value of calling `+` method on the local variable `b` and passing `1.1` as an argument.  the local variable `b` is initialized to the float object `7.3` in `line 2`, and reassigned in `line 6` to `7.3 + 1.1`, i.e., `8.4`.  After this reassignment, the local variable `b` points to a different float object. 

This demonstrates the concept of variable as pointers.

### Example 6

```ruby
def test(str)
  str  += '!'
  str.downcase!
end

test_str = 'Written Assessment'
test(test_str)

puts test_str
```

The code outputs `Written Assessment` and returns `nil`, because on the last line we we call the `puts` method and pass in   `test-str` as an argument. Since `puts` always returns `nil`, the return value is `nil`. 

in `line 6` the local variable `test_str` is initialized to the string object `"Written Assessment"` and is passed as an argument  to the  `test` method  in `line 7`. When we we invoke the method `test` and pass `test_str` as an argument, the method internally assigns the parameter `str` to the object that `test_str`  points to and makes it available to the method body. Although initially `str` and `test_str` point to the same string object, the local variable `str` is reassigned to the return value of concatenating `str` with `"!"`. This string concatenation returns a different string and hence `str` is reassigned to a different object than what 'test_str` points to. After this reassignment, the object that `test_str` points to is no longer available to the method body. Hence, the `test_str` retains its original value, i.e, `"Written Assessment"`. 

This demonstrates the concept of variables as pointers.

### Example 7

```ruby
def plus(x, y)
  x = x + y
end

a = 3
b = plus(a, 2)


puts a
puts b
```

the program outputs `3` (from `line 9`) and `5` (from `line 10`) and returns `nil`. It returns `nil` because the last expression is a `puts` method invocation, which always returns `nil` if executed without an error. 

In `line 5` the local variable `a` is initialized to the integer object `3`. In `line 6` the local variable `b` is initialized to the return value of invoking the method `plus` with two arguments, `a` and `2`. Within the method body `x + y` evaluates to `5` and is reassigned to the local variable `x`. But this affects neither the local variable passed in as an argument nor the object it points to. Since `plus(a, 2)` returns `5`, the local variable `b` is initialized to `5`. 

we call the `puts` method and pass in `a` in `line 9`. This outputs `3` and returns `nil`. 
we call the `puts` method and pass in  `b` in `line 10`. This outputs `5` and returns `nil`. 

This demonstrates the concept of variables as pointers. This also demonstrates the concept of return value of method calls. When we assign a variable to a method call, the variable is assigned to the return value of the method call.



### Example 8

```ruby
def increment(x)
  x << 'b'
end

y = 'a'
increment(y) 

puts y
```

`line 8` outputs `ab` and returns `nil`, because 

1. in `line 5` the local variable `y` is initialized to the string object `a` and passed as an argument to the method `increment`.

2. When we invoke the method `increment` and pass `y` as an argument, the method internally assigns the parameter `x` to the object that `y` points to and makes it available to the method body. At this point, both `y` and `x` point to the same object.

3. In the method body, we invoke the method  `<<` on `x` and pass `b` as an argument. This mutates the object that `x` points to. Hence, the value of `y` becomes 'ab`. 

4. Hence when we call the `puts` method and pass in `y` as an argument, it outputs `ab` and returns `nil`. 

This demonstrates the concept of mutating methods and variables as pointers. 

### Example 9

```ruby
def change_name(name)
  # does this reassignment change the object outside the method?
  name = 'bob'
end

name = 'jim'
change_name(name)
puts name 
```

on `line 8` we call the `puts` method and pass in `name` as an argument. Since the local variable `name` is initialized to the string object `jim` in `line 6` and is not mutated by the method call `change_name(name)` in `line 7`, the output is `jim` and the return value is `nil`. 

In `line 8`, when we invoke the method `change_name` and pass `name` as an argument, the method internally assigns the parameter `name` to the object that the local variable `name` points to and makes it available to the method body. At this point, both the local variable `name` and parameter `name` point to the same object. But when we reassign the variable `name` to the string object `bob` within the method body, the local variable `name` from outside the method is no longer available within the method. 

This demonstrates the concept of variables as pointers. And this also demonstrates the concept of variable scope, in particular, the idea that local variables initialized outside the method cannot be reassigned from inside the method; however, the objects they point to are accessible inside the method only if the variables are passed in as arguments. 

### Example 10

```ruby
def cap(str)
  str.capitalize!   # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name 
```

`line 7` outputs `Jim` and returns `nil`, because

1. in `line 5` the local variable `name` is initialized to  the string object `jim` and passed as an argument to the mutating method `cap`.
2. When we invoke the method `cap` and pass `name` as an argument, the method internally assigns the parameter `str` to the object that `name` points to and makes it available to the method body. At this point, both `str` and `name` point to the same object. 
3. In the method body, we invoke the method  `capitalize!` on `str`. This mutates the string that `str` points to.
4. At this point, the object `name` points to becomes `"Jim"`.
5. Hence, in `line 7` when we call the `puts` method and pass in   `name` as an argument, it outputs `Jim` and returns `nil`. 

This demonstrates the concept of variables as pointers and of object passing. 

### Example 11

```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr

a[1] = 5
arr
```



`line 7` returns [[1, 5], [2]] but outputs nothing, because

1. in `line 1` the local variable `a` is initialized to  the array object `[1, 3]`
2.  in `line 1` the local variable `b` is initialized to  the array object `[2]`
3. in `line 3` when the local variable `arr` is initialized to  the array object `[a, b]`, both `arr[0]` and `a` point to the same the array object `[1, 3]` and both `arr[1]` and `b` point to the same the array object `[2]`
4. in `line 6` when we modify the array object `[1, 3]` by reassigning the second element to `5`,  the array object that both `a` and `arr[0]` point to becomes: `[1, 5]`.
5. Hence, `arr` in `line 7` points to the mutated array object: `[[1, 5], [2]]

This demonstrates the concept of variables as pointers. 

### Example 12

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

puts arr1 
puts arr2
```

`line 7` outputs the element of arr1: `a`, `b`, `c` and returns `nil`. `line 8` outputs  `A`, `B`, `C` and returns `nil`, because

1. in `line 1` the local variable `arr1` is initialized to the array object `['a', 'b', 'c']`
2. in `line 2` the local variable `arr2` is initialized to the copy of array object  `['a', 'b', 'c']
3. in `line 3` we call the destructive `map!` method on the object `arr2` points to and mutate the object by collecting the return values of the `do..end` block passed to it.
4. on each iteration, the block returns the object returned by calling `upcase` method on each element
5. Hence, `arr2` is transformed to: [ `A`, `B`, `C` ]
6. While the `map!` method mutates `arr2` in-place, it does not mutate the object that it shares with `arr1`. (things would be different if we had called `upcase!` method inside the block.)

This demonstrates the concept of variables as pointers and how the map method works. 

<!--Object Mutability / Mutating Methods -->

### Example 1

```ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
```



At the end of the code, `s` has value `"HELLO!"` and `t` has value `"HELLO!"`, because at `line 7` the local variable `s` is initalized to the string object `hello` but the string object is mutated from within the method. 

In `line 8` we call the `fix` method and pass in `s` as an argument. At this point, both the local variable `s` and the method parameter `value` point to the same string object. 

Inside the method body, in `line 3` we call the `upcase!` method on `value` and this method call mutates the string object `value` points to by changing all the letters to their corresponding uppercase form. Then another mutating method `concat` is called on the object and `"!"` is added to the string. Hence, the final result is `"HELLO!"`. This is what is returned by `fix(x)` and this string object is assigned to the local variable `t` in `line 8`.

This demonstrates the concept of mutating methods. 

### Example 2

```ruby
def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```



The code returns `"HELLO!"` and outputs nothing.

At the end of the code, the local variable `s` is still pointing to the string object `hello`; however, the local variable `t` points to a different string object `"HELLO!"`. 

After the local variable is initialized to the string object `"hello"` in `line 6`, it is neither reassigned nor the string object is modified. Hence, `s` retains its value. 

In `line 7` when we call the `fix` method on `s`, both `s` and the method parameter `value` point to the same string object. But the parameter `value` is reassigned to the return value of calling `upcase` method on the string object `"hello"`. Hence the parameter `value` is reassigned to a different string object `"HELLO"`. Then a mutating method `concat` is called on `value` with `"!"` passed as an argument. Since this is the last line of the method body, `fix(s)` returns `"HELLO!"` and this is assigned to the local variable `t`. 

This demonstrates the concept of variables as pointers and the concept of mutating methods. 

### Example 3

```ruby
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```



Once the code is run, the value of `s` and `t` is `"helloxyz"` and `"HELLOXYZ!" respectively, because

1. the local variable `s` is initialized to the string object `"hello"` in `line 7` and passed as an argument with the `fix` method call in `line 8`. 
2. When the `fix` method is invoked with `s`, both the local variable `s` and the method parameter `value` point to the same string object. 
3. in `line 2`, invoking `<<` method on value and passing `"xyz"` as an argument, mutates the object `value` points to. The object become `"helloxyz"`; at this point both `value` and the local variable `s` is pointing to this object.
4. in `line 3`, calling `upcase` method on `value` returns a new string: `HELLOXYZ`. and `value` is reassigned to this new string. At this point, `value` and the local variable `s` are pointing to different objects.
5. in `line 4` calling the mutating method `concat` on `value` with the argument `"!"` further mutates the string object to `"HELLOXYZ!"`
6. `line 4` returns this object and the method call `fix(s)` in `line 8` returns this. since this return value is assigned to the local variable `t`, that is the object it points to. 

This demonstrates the concept of variables as pointers and the concept of mutating methods. 

### Example 4

```ruby
def fix(value)
  value = value.upcase!
  value.concat('!')
end

s = 'hello'
t = fix(s)
```



When the code is executed, the value of both `s` and `t` are `"HELLO!"`, because

1. the local variable `s` is initialized to the string object `"hello"` in `line 6` and is mutated when it is passed as an argument through `fix` in `line 7`.
2. when we call `fix` and pass `s` as an argument, initially both the local variable `s` and the method parameter `value` point to the same string object.
3. After calling the mutating method `upcase!` on `value`, we change the string object to `"HELLO"`
4. `value` is reassigned to this same object in `line 2`. 
5. After calling the mutating method `concat` on `value` with `"!"` as an argument, we change the string object to `"HELLO!"`
6. Since this string object is returned by `fix(s)` and assigned to the local variable `t`, both `s` and `t` point to the same string object and have the same value. 

This demonstrates the concept of variables as pointers and the concept of mutating methods. 

### Example 4

```ruby
def fix(value)
 value[1] = 'x'
 value 
end

s = 'abc'
t = fix(s)
```



in `line 6` the local variable `s` is initialized to the string object `"abc"` and passed in as an argument to the `fix` method in `line 7`. 

Within this method call, the method parameter `value` comes to point to the same object as `s`. Inside the method body we reassign the element at index `1` of the string that `value` points to. Hence the string object become `axc`. Since this is returned by the last evaluated expression `value` of the method body and this is assigned to the local variable `t`, both `s` and `t` point to this object. Hence, they both have the same value '"axc"'.

This demonstrates the concept of mutating method, especially the element assignment method `String[index]=`.

### Example 5

```ruby
def a_method(string)
  string << ' world'
end

a = 'hello'
a_method(a)

p a
```

`line 8` outputs `"hello world"` and returns the same, because the local variable `a` is initialized to the string object `"hello"` in `line 5` and passed through the method `a_method` in `line 6`. 

At this point, both `a` and `string` point to the same string object. Then in `line 2` a destructive method `<<` is called on the string object with `" world"` passed as an argument. This changes the value of `a` from `"hello"` to `"hello world"`.

This demonstrates the concept of mutating methods and object passing. 

### Example 6

```ruby
num = 3

num = 2 * num
```



In `line 3` the value of `num` is reassigned to the string object `6` after the local variable is initialzed to the integer object `3` in `line 1`  .

In `line 3` we invoke the `*` operator on `2` and `3` (that `num` points to); this returns `6` and to this integer object is `num` reassigned. 

This demonstrates the concept of variables as pointers.

### Example 7

```ruby
a = %w(a b c)
a[1] = '-'
p a
```



`line 3` outputs `['a', '_', 'c']` and returns the same array object, because in `line 1` the local variable `a` is initialized to the array object `['a', 'b', 'c']` and then on `line 2` the element of the arry at index `1` is reassiged to '_'. 

Now the value of `a` is `['a', '_', 'c']`; this is what is output and returned by passing `a` as an argument to the `p` method. 

This demonstrates the concept of mutating method. 

### Example 8

```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```



`line 7` outputs `'bob'` and  `'kim'` and returns `nil` because in `line 5` the local variable `names` is initialized to the array object `['bob', 'kim']` and passed through the non-mutating method `add_name` along with the argument `"jim"`. At this point both `arr` and `names` point to the same array object. And the method parameter `name` points to 'jim'.

In `line 2` we call the non-mutating `+` method on the array object that `arr` points to and pass in `name`. We then reassign `arr` to a different array object. Since the array object that `names` points to is not mutated within the method, it retains it original value in `line 7`. When we call the `puts` method and pass in `names` as an argument, it then outputs `'bob'` and  `'kim'` and returns `nil`.

This demonstrates the concept of variables as pointers. This also demonstrates the concept of variable scope, in particular, the idea that local variables initialized outside the method are not accessible within the method unless the variables are passed in as arguments to the method.

<!--- Each / Map / Select --->

### Example 1

```ruby
array = [1, 2, 3, 4, 5]

array.select do |num|
   puts num if num.odd?
end
```



The code outputs `1,`  `3` and  `5` and returns an empty array, because

1. in `line 1` the local variable `array` is initialized to the array object `[1, 2, 3, 4, 5]`
2. in `line 3` `select` method is called on this array object with the `do..end` block passed as an argument
3. `select` method selects elements from the array based on the truthiness of the return values of the block on each iteration. 
4. since the block returns `nil` on each iteration, nothing is selected; hence it returns an empty array.
5. inside the block  if the current element is odd we call the `puts` method and pass in the element. Hence, it outputs only the odd numbers.
6. When the elements are not odd, it returns `nil` as well. Hence, the block returns `nil` in each iteration. 

This demonstrates the concept of truthiness and how the `select` method works. 

### Example 3

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
end
p new_array
```



`line 6` outputs `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` and returns the same, because

1. in `line 1` the local variable `arr` is initialized to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.
2. In `line 3` we initialized the local variable `new_arr` to the return value of calling the `select` method on the object `arr` points to by passing the `do..end` block. 
3. since the select method considers the truthiness of the return value of the block on each iteration and each iteration returns a number incremented by 1 (which is truthy), it selects all the elements and returns a new array.
4. Hence, `arr` and `new_arr` point to different arrays that have the same value. 
5. When `new_array` is passed in as an argument to the method call `p`, it outputs  `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` and returns the same.

This demonstrates the concept of truthiness and how the select method works. 

### Example 4

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
  puts n
end
p new_array
```



`line 7` outputs [] and returns the same, but the `select` method call in `line 3-6` outputs 1, 2, 3, 4, 5, 6, 7, 8, 9, and 10. 

in `line 1` we initialize the local variable `arr` to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. 

in `line 3` we initialize the local variable `new_array` to the return value of calling `select` method on the array object `arr` points to and passing the `do..end` block. On each iteration, `select` method sends the current element to the block. Inside the block, the parameter `n` points to the current element. 

in `line 4` the element is incremented by 1.

in `line 5` the current element is passed as an argument to the `puts` method; this outputs the current element. 

When the iteration is completed, all the elements are printed on the console.

But since the `puts` method returns `nil` and that's the last line inside the block, the block returns `nil` on each iteration. 

SInce the `select` method considers the truthiness of the return values of the block and `nil` is false, no element is selected. Hence, it returns an empty array.

This demonstrates the concept of truthiness and how the select method works.

### Example 5

```ruby
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array
```



`line 7` outputs `[false, true, false, false, true]` and returns the same array object, because

1. in `line 1` the local variable `words` is initiialized to the array `["jump", "trip", "laugh", "run", "talk"]`.
2. in `line 3` the local variable `new_array` is initialized to the return value of calling `map` method on the array `words` point to and passing the `do..end` block.
3. Each iteration, the block returns a boolean by testing if the element starts with the letter `'t'`. 
4. since the `map` method returns a new array populated with the return values of the block, it returns `[false, true, false, false, true]`. 
5. This returned value is what `new_array` points to.
6. When we pass `new_array` to the `p` method in `line 7`, it outputs `[false, true, false, false, true]` and returns a reference to the same object. 

This demonstrates how the map method works; in particular, it demonstrates the idea that `map` method transforms the given collection into an array populated with the return values of the block passed to it. 

### Example 7

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n| 
            n + 1
            end
p incremented
```



`line 6` outputs `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]` and returns the same, because:

1. the local variable `arr` is initialized to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` in `line 1` 
2. in `line 3` the local variable `incremented` is initialized to the return value of the following:
   1. we call the `map` method on the array object `arr` points to and pass in the `do..end` block with the parameter `n`.
   2. on each iteration, block returns the value of `n + 1`; this means, each element is transformed by incrementing 1.
   3. since the `map` method returns a new array populated by the return values of the block, it returns  `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`. 
3. when we pass `incremented` as an argument to the `p` method, it outputs  `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]` and returns the same. 

This demonstrates the concept of how the `map` method works. 

### Example 8

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
end
p new_array
```



`line 6` outputs `[false, true, true, true, true, true, true, true, true, true]` and returns the same, because

1. in `line 1` the local variable `arr` is initialized to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`
2. in `line 3` the local variable `new_arr` is initialized to the return value of the following:
   1. we call the `map` method on the array object `arr` points to and pass in the `do..end` block with the parameter `n`.
   2. on each iteration the block returns a boolean by evaluating whether the element is greater than `1`. 
   3. Since `map` returns a new array populated with the return values of the block, it returns  `[false, true, true, true, true, true, true, true, true, true]` 
3. since `arr` is initialized to  `[false, true, true, true, true, true, true, true, true, true]` and is not reassigned afterwords, when we invoke the `p` method and pass in `new_array` as an argument, it outputs  `[false, true, true, true, true, true, true, true, true, true]` and returns the same.

This demonstrates how the `map` method works. 

<!----- Truthiness ----->

### Example 9

```ruby
def test
  puts "written assessment"
end

var = test

if var
  puts "written assessment"
else
  puts "interview"
end
```



the code first outputs `written assement` and then outputs 'interview'on the console, because

1.  in `line 5` the local variable `var` is initialized to the return value of calling the `test` method.
2. Inside the `test` method, we call the `puts` method and pass in the string object `"written assessment"` as an argument
3. hence, the output is `written assessment`.
4. The return value of `test` is `nil`, since the last evaluated expression is `puts` invocation
5. since `var` is initialied to `nil`, which is a falsey object, the code after the `else` gets executed. Hence, the second output is `interview`. It returns `nil`. 

This demonstrates the concept of truthiness and falseyness.

### New Problems for practice

```ruby
a = 'a'
b = []
3.times do 
  a << '!'
  b << a
end

b[0].chop!
```



after the code is executed, the value of `b` is `["a!!", "a!!", "a!!"]`, because

* we initialize the local variable `a` to the string object 'a' in line 1
* we initialize the local variable `b` to an empty array
* invoking the `times` method on integer `3` we run the `do..end` block three times and in each iteration we mutate the string object `a` points to by appending `!` to the string object `"a"` and each time insert the string object `a` points to into `b`. 
* On the first iteration, `a` has the value 'a!'; on second iteration, `a` has the value `a!!`.
* Hence, the value of `b` at the end of iteration becomes `["a!!!", "a!!!", "a!!!"]`
* In line 8 we modify the string object that each of the element points to by chopping the last character. Hence the local variable `a` and all the elements of `b` now points to `a!!`

This demonstrates the concept of local variables as pointers to memory space. 

```ruby
str = 'abc'
(1..str.size).each_with_object([]) do |i, arr|
  arr +=  str.chars.to_a
end





```



the method invocation `each_with_object` returns an empty array because we call the method  `each_with_object` on a range object and pass in an empty array and a `do..end` block. In each iteration, we reassign the block parameter `arr` to a new array object. Since the object that is being passed to `each_with_object` is no longer referenced by `arr` nothing gets added to the originally initialized empty array. And it is this empty array that gets returned. 

This demonstrates the concept of variables as pointers and how variable reassignment sometimes makes it impossible to mutate an object passed to a method.

```ruby
def fix(value)
  value.concat('!')
  value = value.upcase!
  value << 'xyz'
end
s = 'hello'
t = fix(s)
```



The value of `t` after the code is executed is `"HELLO!xyz"`, because

* the local variable `s` is initialized to the string object `hello` and passed as an argument to the method `fix`
* at this point, both `s` and method parameter `value` point to the same string object
* inside the method `fix` we call the mutating `concat` method on the object `value` points to and pass `"!"` as an argument; this mutates the string object to `"hello!"
* next we we call the mutating `upcase!` method on the object `value` points to; this method call returns the same string after mutation and this object is reassigned to the variable `value`. This means `value` and `s` are still pointing to the same string object `"HELLO!"`
* Lastly, we call the mutating `<<` method on the object `value` points to and pass `"xyz"` as an argument; this mutates the string object to `"HELLO!xyz"` and this being the last evaluated expression is what is returned and stored in `t`.

This demonstrates the concept of mutating methods and variables as pointers.

```ruby
arr = [[1, 2, 3], [4, 5, 6]]

arr.map {|arr| arr.first.last}
```

```ruby
def add_bang(str)
  str.upcase!
end

sample_string = "This is the way!"
add_bang(sample_string)
p sample_string
```

line 7 outputs `"THIS IS THE WAY!"` and returns a reference to the same string object, because 

* the local variable sampe_string is initialized to the string object `"This is the way!"` in line 5 and passed through the method `add_bang` as an argument
* at this point both `sample_string` and method parameter `str` point to the same string object
* in line 2 when we call the destructive `upcase!` method on the object `str` points to, it mutates the string object to `"THIS IS THE WAY!"`.
* Hence in line 7 we we invoke the `p` method and pass in `sample_string` as an argument, it outputs the same string and returns a reference to the string object.

This demonstrates the concept of mutating methods. 
