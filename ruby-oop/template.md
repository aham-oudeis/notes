### Classes and objects

Classes are outlines for what the objects are made up of (states) and what they are able to do (behaviors). 

Objects are instantiations of classes. They have states and behaviors. 

Objects are created from classes when we invoke the `new` class method. Since the `new` class method triggers and passes in all the arguments given to it to the instance method `initialize`, we have to pass in adequate number of arguments to the `new` method invocation.

```ruby
class Person
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end
end

class Book
  def initialize(name, author)
    @name = name
    @author = author
  end
end

dostoyevsky = Person.new("Fyodor", "Dostoyevsky")
the_idiot = Book.new('The Idiot', dostoyevsky) 

# Here the Person object (dostoyevsky) is the collaborator object for the Book object
("the_idiot")

```

### Use `attr_*` to create setter and getter methods

```ruby
class Course
  attr_acessor :name, :teacher
 
  def initialize(name, teacher)
    @name = name
    @teacher = teacher
    @students = []
  end
  
  def enroll(student)
    if students.size < 30
    	students << student
    else
      puts "Class full!"
    end
  end
  
  private
  
  attr_reader :students
end

=begin
attr_* methods are prefered for their simplicity, but when there are other demands
in place, we would have to use manual getter and setter methods. For instance, when we need to have a built-in customization for accessing and setting instance variables.
=end
```

### How to call setters and getters

we call setters and getters on the objects just like any other method calls, writing the getter and setter method name after the dot operator. 

Ruby offfers a nice syntax for the setter methods. While we define the setter methods as follows:

```ruby
def name=(name)
  @name = name
end
```

We can invoke the setter method in a much cleaner way:

```ruby
object.name = 'new name'
```

This is Ruby's syntactical sugar.

### Instance methods vs. class methods

Instance methods are methods we can invoke on the objects and class methods are methods we can invoke on the class. 

If we look under the hood, it turns out that class methods are just instance methods defined for that class object, where the class is treated as an object. These 'class methods' are stored in the singleton_class, which stay slightly hidden.

Inside of the class we define class methods by adding `self.` before the method name. What this does is create a singleton class for the class object and puts the method there. That is why we can simply open the singleton class and put the 'class' methods there just as we put instance methods. 

```ruby
# Here is an explore for how we define the class method and how we call it

class Something
  def self.name
    "This is something."
  end
end

p Something.name
```

###  Method Access Control

Method access control are ways of implementing encapsulation through the usage of _access modifiers_. Method access control enables hiding certain methods and making other methods part of the public interface. Ruby has three _access modifiers_: `public`, `private`, `protected`. 

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

# line 19 throws an error because we cannot call the private methods with an explicit
# caller the way we do in line 8
# but if we change line 11 from private to protected, the code works.

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

# This code works because protected methods can be called from within the class on a different object of the same class or its subclass.
```



### Referencing and setting instance variables vs. using getters and setters

We have two different ways of accessing and changing the value stored in the instance variables. To access the value, we can directly reference the instance variable or we can invoke the getter method. To change the value, we can directly change the value stored in the instance variable or we can invoke the setter method. Despite there being these two ways, it is preferable to rely on getter and setter methods for at least two reasons:

1. by using the getter method, we can have built in customization of the the value either for the sake of presentation (like adding a prefix) or for the sake of data protection (hiding some parts, like bank account).
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



###  Class inheritance, [encapsulation](https://launchschool.com/books/oo_ruby/read/the_object_model#whyobjectorientedprogramming), and [polymorphism](https://launchschool.com/books/oo_ruby/read/the_object_model#whyobjectorientedprogramming)

```ruby
class Course
  attr_reader :name, :book, :syllabus

  def initialize(name, book, syllabus=nil)
    @name = name
    @book = book
    @syllabus = syllabus
    @students = []
  end

  def enroll(student)
    students << student
  end
  
  def assign_responsibilities(participants)
    participants.each do |participant|
      participant.prepare_for(self)
    end
  end
  
  private
  
  attr_reader :students
end

class Person
  attr_reader :first_name, :last_name, :pronoun

  def initialize(first_name, last_name, pronoun)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    @pronoun = pronoun
  end

  def name
    "#{last_name}, #{first_name}"
  end
end

class Student < Person
  def prepare_for(course)
    buy(course.book)
    read(course.syllabus)
  end
end

class TeachingAssistant < Student
  def prepare_for(course)
    # read(course.syllabus)
    # compile_questions(course.syllabus)
  end
end

class Faculty < Person
  attr_reader :rank

  def initialize(first_name, last_name, pronoun, rank)
    super(first_name, last_name, pronoun)
    @rank = rank
  end
  
  def prepare_for(course)
    # email(course.students)
    # create_lesson_plan(course.book)
  end
end

molly = Student.new("Molly", "Holmes", "She/her")

cottonfield = TeachingAssistant.new("Blake", "Cottonfield", "She/her")

mira = Faculty.new("Mira", "Rudal", "She/her", :tenured)

ancient_ethics = Course.new("Ancient Ethics", "Ancient Ethics by Julia Annas")
ancient_ethics.enroll(molly)

ancient_ethics.assign_responsibilities([molly, cottonfield, mira])
```



Encapsulation refers to the practice of hiding certain pieces of functionality from rest of the codebase. This can be implemented in different ways. Ruby implements encapsulation by using objects. Method access control is also one of the ways of implementing encapsulation at the object level.

Polymorphism refers to the ability of different types of objects to respond to the same method call. The basic idea is that if different objects refer to the same method call, it does not matter how the types of the objects differ. What matters is that they respond to the same method. This feature enables programmer to write DRY code. 

Polymorphism enables programmers to work in a rather flexible way with the objects.

## Use of Super

When you invoke `#super` within a method, Ruby looks in the inheritance hierarchy, starting from the superclass, for a method with the same name. 

### [Modules](https://launchschool.com/lessons/dfff5f6b/assignments/2cf31cc8)

Modules are containers for shared behaviors and constants. 

Or, Modules are collections of  behaviors usable in other classes via mixin. 

They can be used for namespacing and extracting common behaviors. 

They are mixed in with classes using the following syntax: `include ModuleName`'', where `ModuleName` stands for the name of the module that is to be included.

```ruby
module Flyable
  def can_fly
    "I am a #{self.class}. I can fly."
  end
end

class Plant
end

class Animal
end

class Mammal < Animal
end

class Bird < Animal
  include Flyable
end

class Bat < Mammal
  include Flyable
end

class Penguin < Bird
end

# Here, a Bat object can invoke the fly method that returns the string object:
# "I am a Bat. I can fly."
```



###  Method lookup path

Method loopup path is the sequential path that Ruby traverses in looking for a method. This path can be found out by calling the `ancestors` method on the class. Ruby invokes the first method it finds in this path; if it does not find any method of that name, it throws a `NoMethod` error. 

This is quite different from how Ruby looks for a constant.

###  self

-   [Calling methods with self](https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1#callingmethodswithself)

We use `self` to call the setter methods from inside the class, because in absence of the `self` Ruby does not know whether we meant to call the setter method or just initialize a local variable. 

> We're required to use `self` so that Ruby knows the difference between initializing a local variable and invoking a setter method.

-   [More about self](https://launchschool.com/books/oo_ruby/read/classes_and_objects_part2#moreaboutself)

We also use `self` to define the class methods (or, rather the methods in the singleton_class.)

`self` is a way of being explicit about the calling object.

`self` references where Ruby is in the program execution or what the calling object is.

###  Reading OO code

### Fake operators and equality

Except for `.` `::`, `ternary operator`, and the logical operators, most of what seem like operators are in fact methods defined for that particular object. 

For instance, when we write `'abc' == 'abcd'` in ruby, we are not using an operator but a method call defined in the String class.

What this does is compare if the two objects have the same value. 

However, when we invoke the same equivalence method for our custom objects without defining == for the custom class, the method Ruby finds is from BasicObject, which compares the two objects by checking if they are the same object, not if the two objects have the same value.

### Truthiness

In Ruby anything except `false` or `nil` evaluates as `true`. That means, a custom object with no attributes would be considered `truthy`. 

```ruby
class Something; end
empty_object = Something.new

empty_objet ? "Empty Object is Truthy" : "Empty Object is Falsey."

#=> "Empty Object is Truthy."

# one new thing from OOP is that uninitialized instance variables returns nil;
# so, if we happen to evaluate an uninitialized instance variable, then
# it would evaluate as false.

class Something
  attr_reader :name
end

empty_object = Something.new

empty_objet.name ? "Empty Object is Truthy" : "Empty Object is Falsey."

#=> "Empty Object is Falsey."

# This is because, the calling the name method on the empty_object returns
# a reference to the instance variable @name, which is not yet initialized
# hence, it returns nil and thus empty_object.name evaluates to false.
```

###  Working with collaborator objects

Collaborator objects are objects that are part of the state of another object.

```ruby
class Course
  def initialize(name, teacher, students)
    @name = name
    @teacher = teacher.capitalize
    @students = students
  end
end

=begin
In this example, we define the Course class such that a string object stored in the instance variable @teacher is part of the Course object's attribute. In this sense, the string object is a collaborator object of Course object. 

Say, we store an array object in the instance variable @students. In that case, the array object would be the collaborator object of the course object.
=end
```

