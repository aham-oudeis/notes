p ([1, 2, 3].reduce do |acc, num|
  acc + num
end)

# => 6

# [1, 2, 3].reduce do |acc, num|
#   acc + num if num.odd?
# end

# => NoMethodError: undefined method `+' for nil:NilClass

# But the following runs without throwing an error.

[1, 2].reduce do |acc, num|
  acc + num if num.odd?
end

# This is because the acc gets assigned to 1, and num gets assigned to 2
# since num.odd? returns false, line 16 returns nil.
# this is what is returned by line 15
# but if this value were to be passed to another block, it would throw an error

def reduce(arr, acc = nil)
  iterable = (acc ? arr : arr[1..-1])

  acc = (acc ? acc : arr.first)

  for item in iterable
    acc = yield(acc, item)
  end

  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']