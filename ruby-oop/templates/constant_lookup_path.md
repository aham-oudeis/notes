### Constant Look up Path

Constants have lexical scope. What this means is that Constants are available to a method call if they are defined in the enclosing module or the inheritance heirarchy of the class where the constant is referenced.

Overall, the constant look up path is weird because, unlike the method look up path, it does not depend on the calling object. Rather it depends on where in the code Ruby first finds the Constant reference expression.

The following code raises an error complaining that it cannot find the constant. However, if we uncomment the line where we declare the constant inside the class `Something`, the code works. This is because the reference to `CONS` is in the instance method defined in `Something` class.

```ruby
class Something
  # CONS = "A Constant declared in Something"
  def what_am_i?
    puts "I am #{CONS}"
  end
end

class SomeSpecificThing < Something
  CONS = "A Constant declared in Some Specific Thing."
end

table = SomeSpecificThing.new

table.what_am_i?
```

Let's put a Constant in the class, in the superclass, in the module and test which one has precedence:

```ruby
CONS = "This is from the outer scope."

class SuperTest
  CONS = "This is a constant in inheritance hierarchy."
end

module A
  module Ba
    CONS = "This is a module Constant."

    module Cc
      class Test < SuperTest
        CONS = "This is a class constant."
        def check
          puts CONS
        end
      end
    end
  end
end

A::Ba::Cc::Test.new.check
# => "This is a class constant."
```

This shows that the constant in the class has the highest precedence. Or, that for the constant look up path, the class comes first. when we comment out the class constant as follows and run the code:

```ruby
CONS = "This is from the outer scope."

class SuperTest
  CONS = "This is a constant in inheritance hierarchy."
end

module A
  module Ba
    CONS = "This is a module Constant."

    module Cc
      class Test < SuperTest
        # CONS = "This is a class constant."
        def check
          puts CONS
        end
      end
    end
  end
end

A::Ba::Cc::Test.new.check
# => "This is a module Constant"
```

This should be a bit surprising, given that  we would expect the Constant in the superclass to have precedence. This is what it means to have lexical scope. When it comes to finding  a constant, Ruby looks wherever the call for the constant comes up and then goes outward in the nested modules.

Now we know that in terms of looking for a constant, Ruby looks in the nested structure first.

what if the constant is defined outside of the module? We have two choices: either the constant is defined in the superclass or it is defined in the 'main' object.

Let's comment out the constants defined in the modules and leave only the ones defined in the 'main' scope and then in the superclass.

```ruby

CONS = "This is from the outer scope."

class SuperTest
  CONS = "This is a constant in inheritance hierarchy."
end

module A
  module Ba
    # CONS = "This is a module Constant."

    module Cc
      class Test < SuperTest
        # CONS = "This is a class constant."
        def check
          puts CONS
        end
      end
    end
  end
end

A::Ba::Cc::Test.new.check

# => "This is a constant in inheritance hierarchy."
```

This should be a bit more surprising.
Instead of looking for the Constant in the 'main' object, Ruby actually looks for the constant in the superclass.

This is because the constant defined in the 'main' object is actually defined for an object in the Object class. (This part I am not sure, but something like this is true, because when we run `self.class` we get Object.) And Object is the superclass of SuperTest. That means, Object comes after SuperTest in the inheritance heirarchy.

> When a constant is referenced without any qualifying namespace, the Ruby interpreter must find the appropriate definition of the  constant. To do so, it uses a name resolution algorithm, just as it does to find method definitions. However, constants are resolved much  differently than methods.
>
> Ruby first attempts to resolve a constant reference in the lexical scope of the reference. This means that it first checks the class or  module that encloses the constant reference to see if that class or module defines the constant. If not, it checks the next enclosing class or module. This continues until there are no more enclosing classes or  modules. Note that top-level or “global” constants are not considered  part of the lexical scope and are not considered during this part of  constant lookup. The class method `Module.nesting` returns the list of  classes and modules that are searched in this step, in the order they  are searched.
>
> If no constant definition is found in the lexically enclosing scope, Ruby next tries to resolve the constant in the inheritance  hierarchy by checking the ancestors of the class or module that referred to the constant. The `ancestors` method  of the containing class or module returns the list of classes and modules searched in this step.
>
> If no constant definition is found in the inheritance hierarchy, then top-level constant definitions are checked. (from The Ruby Programming Language)

>The important difference between constants and methods is that constants are looked up in the lexical scope of the place they are used before they are looked up in the inheritance hierarchy