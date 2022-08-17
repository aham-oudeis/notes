<!-- Truthiness -->

In Ruby any expression that does not return `false` or `nil` is considered truthy. 

In Ruby every object other than `false` and `nil` are considered truthy; although only the boolean object `true` is, strictly speaking, true.

Does that mean `true` is also truthy? Sounds odd. 

The following code demonstrates the concept of __truthiness__

```ruby
str = 'something'

if str
  puts 'String object returns a truthy value'
else
  puts 'Something wrong with the conditional statement.'
end
```

If one mistakenly assigns or reassigns some value in the conditional statement, that also evaluates to true. This can be a tricky source of a bug.

```ruby
str = 'something'

if str = 'nothing'
  puts 'String object returns a truthy value'
else
  puts 'Something wrong with the conditional statement.'
end
puts "str:" + str
```

