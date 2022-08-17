<!-- Short Circuiting Behavior -->

```ruby
if true || 10/0
  puts "No Zero Division Error"
end
```

This expression evaluates to `true`, because the first disjunct can guarantee that the expression evaluates to `true`. It demonstrates the principle of short-circuiting.However, the following code would throw a ZeroDivision Error

```ruby
if 10/0 || true
  puts "No Zero Division Error"
end
```

Sidenote: this zerodivision error does not occur when the numerator is a float, because dealing with a float zero division returns Infinity.

```ruby
if 10.0 / 0 || true
  puts "No Zero Division Error"
end
```

