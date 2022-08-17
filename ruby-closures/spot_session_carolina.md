# Create a `my_method` method definition that will output what is expected when the last two are executed.

```ruby
def my_method(&block)
  block_given? ? block.call : "No block is given"
end

name = "Launch School"
hi = Proc.new { puts "This is #{name}."}
my_method(&hi)  # This is Launch School.
#p my_method # No block is given.


name = "Alonso"
def call_me(some_code)
  some_code.call
end

chunk_of_code = Proc.new { puts "Hi #{name}"}

p call_me(chunk_of_code)
```

```ruby
def echo_with_yield(str)
  yield(str, 4)
end

echo_with_yield("hello") { |st| p "#{st} world"}
```

```ruby
def test
  yield(1)
end

p test { |num1, num2| puts "#{num1} #{num2}"}
```

```ruby
# Return the integer 2 (ableit string or integer)
def call_this(&block)
  # block.call(2)
  # block[2]
  # yield 2
end

p call_this(&:to_s) # returns 2
p call_this(&:to_i) # returns "2"

sym_proc = proc { |item| item.to_sym }

p [1, 2, 3].map(&:to_s) #to_proc. :to_s Symbol

p ["a", "b", "c"].map(&sym_proc)

unary operator
```