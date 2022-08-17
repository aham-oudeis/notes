## Use Cases of Blocks

There are two main use cases for blocks:
1. Deferring some decision on how the method is used to the time of method invocation
2. In sandwich-code scenarios, i.e., when we have to perform some before and after actions.

### Deferring decision
For instance, `select` method can be used to select all kinds of elements; we can select only odd numbers from a list, we can select strings of certain lengths, etc. This flexibility is available because of how the `select` method relies on the return value of the block to select the element.

```ruby
(1..99).select { |num| (num % 3 == 0) && (num % 5 == 0) }
# => [15, 30, 45, 60, 75, 90]

%w(Cat Dog Buffalo Cow Penguin Eagle).select { |string| string.length > 4 }
# => ["Buffalo", "Penguin", "Eagle"]
```
Likewise, when we seek to defer some decision to method invocation, we can use blocks.

For instance, we may want a generic method that takes a number and a power and returns the given power of that number. We may want to yield the result to the block, so that we can perform other operations with the return value.

```ruby
def power(num, power)
  result = num ** power
  yield(result) if block_given?
  result
end

power(13, 7) { |num| puts (num % 17) }
# => 62748517
# Outputs: 4 (from block)

puts power(15, 3)
# => 3375
# Outputs: 3375
```

###  Sandwich-code scenarios
Sometimes, we may want to perform some 'before' and 'after' action for some code. We can do that to measure the time it takes to run the code, or to open and close files (resource management).

```ruby
def time_it
  start = Time.now
  yield
  finish = Time.now
  diff  = finish - start
  "It took #{diff} secs to run the code."
end

p time_it { 1000000.times {2 * 2} }

p (time_it do
  counter = 1
  while counter <= 1000000
    2 * 2
    counter += 1
  end
end)
```
