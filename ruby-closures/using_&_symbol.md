# Using &:symbol

When we pass a symbol or a proc to a method with `&` operator prefixed, then Ruby attempts to convert what is passed in to a block. If a proc object is passed in, then `&` converts the proc into a block. If it is not a proc , Ruby attempts to convert the argument to a proc before converting it into a block.

For example:

```ruby
p [1, 2, 3].map { |item| item ** 2 }
# [1, 4, 9]
```

```ruby
square_proc = proc { |item| item ** 2 }
p [1, 2, 3].map(&square_proc)
# [1, 4, 9]
```

We can also pass in a symbol with `&` prefixed, because Ruby can convert the symbol to a proc. `to_proc` method is defined for symbol objects.

```ruby
p [65, 66, 67].map(&:chr)
# ["A", "B", "C"]
```

This means, anything that has a corresponding `to_proc` method can be passed in with `&` prefixed.

```ruby
def square(n)
  n ** 2
end

sqr = method(:square)

p [1, 2, 3].map(&sqr)
# [1,  4, 9]
```
On line  32, we pass in the symbol with the method name `square` to the method named `method`. This converts the `square` method to a `Method` object. This method object is stored in the local variable `sqr`.

Since `Method` object created in line 32 also has a `to_proc` method available, we can pass in `&sqr` to the `map` method and Ruby internally converts the `Method` object to proc and then to a block.
