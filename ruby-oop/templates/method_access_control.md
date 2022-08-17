###  Method Access Control

Method access control are ways of curating the public interface of  an object through the usage of _access modifiers_ in the class. Method access control enables hiding certain methods and making other methods part of the public interface. Ruby has three _access modifiers_: `public`, `private`, `protected`.

> A private method is internal to the implementation of a class, and it can only be called by other instance methods of the class (or, as we’ll see later, its subclasses). Private methods are implicitly invoked on self, and may not be explicitly invoked on an object.
>
> Protected methods are very similar to private methods. The main  difference between them is protected methods allow access between class  instances, while private methods don't. If a method is protected, it  can't be invoked from outside the class. This allows for controlled  access, but wider access between class instances.
>
> A protected method is like a private method in that it can only be invoked from within the implementation of a class or its subclasses. It differs from a private method in that it may be explicitly invoked on any instance of the class, and it is not restricted to implicit invocation on self. A protected method can be used, for example, to define an accessor that allows instances of a class to share internal state with each other, but does not allow users of the class to access that state. (p. 232)

Example:

```ruby
class BankAccount
  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  def >(other)
    balance > other.balance
  end

  private

  attr_reader :balance
end

bill = Account.new("Billy", 2957)
marvin = Account.new("Marvin", 38271)

p bill > marvin
```

The code above throws an error because we cannot call the private
methods with an explicit caller the way we do in line [] (inside the `>` method)
but if we change line [] from `private` to `protected`, the code
works, because protected methods allow access between class
instances from within the class.

```ruby
class BankAccount
  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  def >(other)
    balance > other.balance
  end

  protected

  attr_reader :balance
end

bill = Account.new("Billy", 2957)
marvin = Account.new("Marvin", 38271)

p bill > marvin #=> false

```