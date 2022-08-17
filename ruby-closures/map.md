### Map

Using Recursion

```ruby
def map_helper(arr, collection, &b)
  if arr.empty?
    collection
  else
    collection += [b[arr.first]]
    arr = arr[1..-1]
    map_helper(arr, collection, &b)
  end
end

def map(arr, &b)
  map_helper(arr, [], &b)
end

p map (1..10).to_a, &:odd?
```