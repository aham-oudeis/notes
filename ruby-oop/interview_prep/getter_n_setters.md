# getter and setter methods
getter methods are instance methods that allow us to access the instance variable (in some form).

setter methods are instance methods that allow us to change the value stored in the instance variable.

Setter methods are especial because of Ruby's syntactic sugar. When it comes to calling the setter method from outside, we do as follows:

```ruby
class Student
  attr_reader :name, :courses, :balance

  def balance=(amount)
    @balance = amount
  end
end

cory = Student.new
cory.balance = 9301 # This is Ruby's syntactical sugar.
```

Athough we define the setter method as having the name `balance=` with `amount` passed in as an argument, Ruby offers us a much cleaner sytax.

Furthermore, when we call setter methods from inside the class, we have to prepend `self.` to the setter name so as to disambiguate from initializing a local variable and invoking a setter method.

```ruby
class Student
  attr_reader :name, :courses, :balance

  def pay_balance(amount)
    self.balance = balance - amount
  end

  def balance=(amount)
    @balance = amount
  end
end

kyle = Student.new

kyle.balance = 2939
p kyle.balance
kyle.pay_balance(3983)
p kyle.balance
```

If we remove `self` before `balance` in line 30, it would not update the value stored in the instance variable `@balance`.
