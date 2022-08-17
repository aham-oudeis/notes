# what is encapsulation
* bundling data and functionality to allow selective access to them.
* ruby implements encapsulation by creating objects.
* in general, objects encapsulate state and classes encapsulate behaviors.
* method access control allows another layer of encapsulation

# aspects of it
1. hiding data at the object level
2. hidng functionalites at the class level
3. public interface
# examples

```ruby
class Student
  attr_reader :name, :courses, :balance

  def initialize(name)
    @name = name
    @courses = []
    @balance = 0
  end

  def enroll(course)
    @courses << course
  end

  def pay_balance
    #payment portal that uses the setter for balance
  end

  private

  attr_writer :balance
end

cory = Student.new("Cory Bussel")

p cory
```
Here the `cory` object encapsulates the data stored in the `@name` instance variable. So far we have very little data stored in the `cory` object, but we could have more.

At the class level, we have restricted access to the setter method for `balance` so that client code can only change the balance if they have paid the balance, through some payment portal system.