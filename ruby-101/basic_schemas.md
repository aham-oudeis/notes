<!---- Conclusion ---> 

After this, neither  `var` is reassigned nor the object that `var` points to is mutated.

<!--Initialization-->

On line `some_num` of this code the local variable `var_name` is initialized to the string object / array object / hash object with value ` some_value` to it. 

On line `some_num` the local variable `var_name` is reassigned to a different string/integer/array object. That means, the local variable `var_one` and `var_two` are now pointing to different objects. While `var_one` points to the object with value `some_value`, `var_two` points to the object with value `another_value`.

<!--Variable Scope -->

This demonstrates the local variable scoping rules in Ruby; in particular, the idea that variables initialized outside the block are accessible inside the block but not vice versa. 

This demonstrates the local variable scoping rules in Ruby, in particular, the idea that local variables initialized outside the method cannot be reassigned from inside the method; however, the objects they point to are accessible inside the method only if the variables are passed in as arguments.

<!--Variable As Pointers -->

This demonstrates the concept of variables as pointers. And this also demonstrates the concept of variable scope, in particular, the idea that local variables initialized outside the method cannot be reassigned from inside the method; however, the objects they point to are accessible inside the method only if the variables are passed in as arguments.

<!--Variable Shadowing -->

On `line X` we are calling `some_method` and passing `do..end` block as an argument with one parameter `parameter_name`.

This demonstrates the concept of variable shadowing; in particular, the idea that when a block's parameter has the same name as a local variable initialized in the outer scope, variables  initialized in the outer scope that share the same name with the parameter are no longer accessible from inside the block.

<!-- Method Calls -->

we call the `M` method on the object `Y` points to

When we invoke the method `M` and pass `Y` as an argument, the method internally assigns the parameter `X` to the object that `Y` points to and makes it available to the method body. At this point, both `Y` and `X` point to the same object.

<!-- Mutating Methods -->

in `line X` calling the mutating method `some_method` on the object `parameter` points to and passing in the argument `"arg"` further mutates the  object to `"mutated_object"`

in `line X`, invoking the mutating `method_name` method on the object `variable` points to and passing `arg` as an argument, mutates the object `variable` points to. The object becomes `"mutated_object"`; at this point both the method parameter `variable` and the local variable `some_var` are pointing to this object.

in `line X`, invoking the non-mutating `method_name` method on the object `variable` points to and passing `arg` as an argument, returns a reference to a new object. The new object has the value `"mutated_object"`. 

<!-- Truthiness -->

In Ruby any expression that does not return `false` or `nil` is considered truthy. 

<!---- Each / Map / Select --->

This demonstrates how the`select` method works; in particular, the `select` method returns a new array populated with the selected elements from the calling array, where the selection is based on the truthiness of the return values of the block on each iteration.

On each iteration, `select` method sends the current element to the block. Inside the block, the parameter `n` points to the current element. 

This demonstrates how the map method works; in particular, it demonstrates the idea that `map` method returns an array populated with the return values of the block passed to it. 

<!--- Sorting --->

Sorting returns a new Array of ordered items by comparing elements with the `<=>` method. Since all elements are String objects, the comparison is carried out character-by-character according to the character's position in the ASCII table. Characters that appear earlier in the ASCII table are smaller than the ones that appear later. Also, when two String objects are equal up to the shortest length, the shorter string comes before the longer string.
