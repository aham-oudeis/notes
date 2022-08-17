# Each method

```ruby
def each(iter)
  count = 0
  while count < iter.size
    yield iter[count]
    count += 1
  end

  iter
end

def each(iter)
  for item in iter
    yield item
  end

  iter
end

## Using recursion

def feed(iter, &block)
  iter.empty? ? return : block.call(iter.first)

  new_iter = iter[1..-1]
  feed(new_iter, &block)
end

def each(iter, &block)
  feed(iter, &block)

  iter
end

p each([1, 2, 3, 4]) {|n| puts n}
```