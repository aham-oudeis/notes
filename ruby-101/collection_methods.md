<!-- Collection Methods: each, select, map -->

## On `each` Method

-A method called on the object (either array or a hash) that feeds each element to the block per iteration

-the method takes a block [`do...end` or `{}`] and the code within the block is executed on each iteration

-on each iteration, `each` feeds the currrent element to the block in the form of an argument and the parameter points to the value of the element

-when the object is an array, it feeds one element per iteration to the block; hence, we assign one parameter when we call `each` on an array

```ruby
[1, 2, 3].each do |num|
  puts num
end
```



-when the object is a hash, it feeds (hash, value) pair per iteration to the block; hence, we assign a pair (k, v) when we call `each` on a hash

```ruby
{a: 1, b: 2, c: 3}.each do |key, value|
  puts  [key, value]
end
```



#### what `each` returns

-It returns the original collection on which the method was called or, in short, the caller

```ruby
['a', 'b', 'c'].each {|char| puts char}
=> ['a', 'b', 'c']
```

-if the original collection is transformed from within the `each` method invocation, `each` returns the transformed collection.

```ruby
['a', 'b', 'c'].each {|char| char.upcase!}
=> ["A", "B", "C"]
```

Here, we call `each` method on the arry `['a', 'b', 'c']` and pass a block `{}`. 

On each iteration, the `each` method supplies the element of the collection and code in the block transforms the element in place by calling the destructive `upcase!` method on each character. That is, each string element is mutated.

Since the original collection is mutated from within, the `each` method in returning the original collection returns the mutated original collection. 

## On `select` Method

`select` method selects the element from the collection based on the __return values of the block__ on each iteration. 

If the return value of the block is __truthy__ the corresponding element is selected; if it is __falsey__, the corresponding element is not selected. The return value of the block is the return value of the last exprression in the block. Example:

```ruby
(1..9).select {|num| num.odd?}
=> [1, 3, 5, 7, 9]

# a destructive version: select!

arr = (1..9).to_a

arr.select! {|num| num.odd?}
=> [1, 3, 5, 7, 9]

p arr => [1, 3, 5, 7, 9]
```

#### Truthiness of the return value of the block

```ruby
(1..9).select do |num| 
  num.odd?
  puts num
end
  
=> []

# because the last line of the block returns nil and hence the block returns nil
# since nil is falsey and nil is returned by the block on each iteration, no element is selected
```



#### what `select` returrns

It returns a collection of selected elements; if nothing is selected, it returns an empty collection.

```ruby

arr = (1..9).to_a
hash = {a: 1, b: 2, c: 3, d: 4}

arr.select {|num| num > 9}					=> []

hash.select {|k, v| v > 3} 					=> {:d=>4}

hash.select {|k, v| v > 4}					=> {}
```



#### a weird case to illustrate how `select` works [bad practice!!!]

```ruby
arr = (1..9).to_a

arr.select do |num|
  arr.delete(num) if num.odd?
  num.odd?
end

=> [2, 4, 6, 8, nil] # But none of these are odd!!!

# for a clearer illustration
arr = (1..9).to_a

arr.select do |num|
  p arr
  arr.delete(num) if num.odd?
  p num
  num.odd?
end

# Output:
[1, 2, 3, 4, 5, 6, 7, 8, 9]
1
[2, 3, 4, 5, 6, 7, 8, 9]
3
[2, 4, 5, 6, 7, 8, 9]
5
[2, 4, 6, 7, 8, 9]
7
[2, 4, 6, 8, 9]
9
=> [2, 4, 6, 8, nil]

```



On the first iteration, select picks `arr[0]` and feeds it to the block. At this time `arr[0]`and `num` point to the same number, i.e., `1`. Inside the block, we take the original array and delete the number if it is odd. That is, we delete `1`. Now the `num` still points to `1`, but `arr[0]` no longer points to `1`. The last line of the block returns `true`, because `1.odd?` evaluates to `true`. Then the select method selects `arr[0]` because the first iteration returned `true`, but by that time `arr[0]` is `2`. Hence, `2` gets selected.

On the second iteration, select picks `arr[1]` and feeds it to the block. At this time `arr[1]`and `num` point to the same number, i.e., `3`. Inside the block, we take the original array and delete the number if it is odd.  That is, we delete `3`. Now the `num` still points to `3`, but `arr[1]` no longer points to `3`. The last line of the block returns `true`, because `3.odd?` evaluates to `true`. Then the select method selects `arr[1]` because the second iteration returned `true`, but by that time `arr[0]` is `4`. Hence, `4` gets selected.

The same thing happens on each iteration. On the last iteration, `arr[4]` and `num` both point  to `9`. Since  `9.odd?` evaluates to `true`, `arr[4]` is supposed to be selected, but is no longer there. Hence, the `nil` value, because `arr[4]` returns `nil`.

## On `map` Method

`map` performs transformation based on the return value of the block. On each iteration, the current element is fed to the block. `map` retuns an array of the return value of the block from each iteration.

```ruby
(1..9).map {|num| num*num}

=> [1, 4, 9, 16, 25, 36, 49, 64, 81]
```



#### weird case once again

```ruby
arr = (1..9).to_a

arr.map do |num|
  num.odd?
end

=> [true, false, true, false, true, false, true, false, true]


arr = (1..9).to_a

arr.map do |num|
  arr.delete(num) if num.odd?
  num.odd?
end

=> [true, true, true, true, true]

# but if we check the elements in the arr, we see

arr => [2, 4, 6, 8]

# a similar explanation to the one provided in case of select works here too. 
```



