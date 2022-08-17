### Referencing and setting instance variables vs. using getters and setters

We have two different ways of accessing and changing the value stored in the instance variables. To access the value, we can directly reference the instance variable or we can invoke the getter method. To change the value, we can directly change the value stored in the instance variable or we can invoke the setter method. Despite there being these two ways, it is preferable to rely on getter and setter methods for at least two reasons:

1. by using the getter method, we can have built in customization of the the value either for the sake of presentation (like adding a prefix) or for the sake of data protection (hiding some parts, like bank account). When it comes to changing the code, it would be a hassle if the customization is all over the place. It's better to have the customization in one place.
2. by using the setter method, we can customize the value that is stored in the instance variable.
   - For instance, although we allow the setter method to take a string as an argument, we may want to actually store a different object (say, Book object) with that value, instead of storing a string object.

```ruby
class BankAccount
  def initialize(client, account_number)
    @client = client
    @account_number = account_number
  end

  def account_number
    to_show = 4
    chars = @account_number.digits.reverse
    hide_index = chars.size - to_show
    chars.map.with_index { |n, i| i < hide_index ? '*' : n }.join
  end
end

bill = BankAccount.new("Bill Somsky", 9124817292)

p bill.account_number
```

Data protection: also to prevent the instance variable value from being altered through a destructive method call.

```ruby
class Student
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

molly = Student.new("Molly")

molly.name.upcase!.reverse!

molly.name # => YLLOM (Not what we would want.)
```

Rather we would want something as follows:

```ruby

class Student
  def initialize(name)
    @name = name
  end

  def name
    @name.clone
  end
end

molly = Student.new("Molly")

molly.name.upcase!.reverse!

molly.name # => Molly
```

