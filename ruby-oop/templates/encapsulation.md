I particularly like Karl Lingiah's explanation [here](https://launchschool.com/posts/2fa7508d).

Catherine Emond's sensitivity to the disagreements about how people understand the concept makes her [explanation](https://launchschool.com/posts/a8e43f97) particularly illuminating.

Encapsulation refers to the practice of bundling data and functionality in a single construct, such as object, so as to control access to the data and functionality. This is where the concept of public interface is relevant. Public interface is how we work with the encapsulated data. The `public` methods that we can call on an object comprise the public interface.

Ruby implements encapsulation by using objects. Broadly speaking, classes encapsulate behaviors and objects encapsulate state.

Method access control is also one of the ways of implementing encapsulation at the class level. (Hiding implementation details).

 **Benefits**
  1. Data protection
  2. Preventing unintentional changes in the code
  3. Makes the code easier to maintain by reducing dependencies

Example of 'object encapsulate state'

```ruby
class Student
  attr_reader :balance

  def initialize(name)
    @name = name
  end

  def name
    @name.clone
  end
end

kyle = Student.new("Kyle Mullen")
```

In this example, the `kyle` object encapsulates state by storing data in the instance variables: `@name`, `balance`. It's this bundling of data and behavior in a single object that is called encaapsulation.

Controlling acess to certain methods available to the object is one aspect of encapsulation. While we can access the data stored in the `kyle` object using the getter methods, we are not able to change the data stored there. If we were to directly access the data stored in the `@name` instance variable, we would be able to change it by calling various destructive methods available for string objects. Hence, encapsulation enables data protection.

And class `Student` encapsulate behaviors available for objects instantiated from `Student` by hiding certain pieces of functionality and exposing certain methods as part of the public interface.

Let's build on the same example:

```ruby
class Student
  attr_reader :balance

  def initialize(name)
    @name = name
  end

  def name
    @name.clone
  end

  def pay_balance
    payment_portal
  end

  private

  def payment_portal
  end

  attr_writer :balance
end
```

We may want to hide certain functionalities, such as being able to change the balance. We would want change the balance only if it is paid or waived. Hence, we hide the setter method for `balance`.

A more elaborate example of 'class encapsulate behaviors'.

Let us suppose a Computer is a player in some strategic board game. When we are writing a program for the game, we can simply create a Computer object and let it handle all the tasks that the Computer ought to do. Here is an outline for how the Computer might make a choice:

```ruby
class Computer
  def initialize
    @name = options.sample
  end

  def options
    ["Hal", "Alpha", "Deep Blue",  "Aster"]
  end

  def chooses(board)
    strategic_choice(board)
  end

  private

  def strategic_choice(board)
    if win_possible?(board)
      winning_move(board)
    elsif loss_possible?(board)
      prevent_loss(board)
    elsif high_priority_move_available?(board)
      choose_high_priority_move(board)
    else
      choose_randomly(board)
    end
  end

  def win_possible?(board)
  end

  def winning_move(board)
  end

  def loss_possible?(board)
  end

  def prevent_loss(board)
  end

  def high_priority_move_available?(board)
  end

  def choose_high_priority_move(board)
  end

  def chooses_randomly(board)
  end
end

class Board
end

board = Board.new
computer = Computer.new
computer.chooses(board)
```

In this code, all the details about how a computer finds a move is hidden from the rest of the code base. We can simply invoke the method `chooses` on the `computer` object and pass in the `board`. The method invocation returns the move to be made and it suffices for the rest of the program to work. Rest of the code base does not need access to other details about the computer. All the implementation details are hidden from the public interface. This practice of hiding unnecessary details is a key aspect of encapsulation.