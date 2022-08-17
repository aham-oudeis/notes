# what is polymorphism?
the ability of differrent kinds of objects to respond to the same method invocation

For instance: [1, "2", [3, 4], "hi "].map {|item| item *  2}

In this example, all the array items respond to the `*` method. It doesn't matter what class they belong to as long as they all respond to the `*` method invocation with `2` passed in as an argument. This is polymorophism.

# types of polymorophsm
1. through inheritance: related types; common interface
2. duck typing: unrelated types; common interface

A meaningful usage of polymorphism requires intentional design of the public interface so that various objects respond to the same method invocation.

For detailed examples, see [this](../../Notes/templates/polymorphism.md).

# what are the benefits?
* avoid code duplication
* reduce dependencies
* more maintainable code

