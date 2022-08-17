Objects can be thought of as a bundle of two kinds of things: properties and behaviors. We can have objects without any methods attached to them. In creating such objects, we are not relying on the prototypal pattern of JS, because the role of prototype is to delegate behaviors.

For ease of understanding, let's say that the objects without behaviors are called 'simple objects' and objects with behaviors are called 'complex objects'.

Hence, the discussion of 'object creation' can be thought of in two ways: creation of simple objects and creation of complex objects.

## Patterns of Object Creation
1. [Object Factories](function_as_object_factories.md)
2. [Constructor Function](#constructor-pattern)

## Constructor Pattern
- when a function is invoked with a new keyword, a new object is created and the function is invoked with the value of `this` set to the new object
- if the function does not return an object, then the new object is returned

We can see how the new keyword works as follows:

```javascript
function newish(function, args) {
  let minted = Object.create(function.prototype);
  let returned = function.call(minted, ...args);

  return typeof returned === object ? returned : minted;
}
```

Invoking a function with the `new` keyword amounts to passing the function and its arguments to the `newish` function.

Since constructor functions are just ordinary functions, JS community has adoped a practice of capitalizing the first letter of the constructor's name so that one can easily tell that the function is a constructor function.

However, given that one may fail to use the `new` keyword at times, we can design the constructor function to be scope-safe, i.e., that the function works well even if one forgets to use the `new` keyword.

If the function is invoked without the `new` operator, then the value of `this` inside the function will not be the object created from the function's prototype. We can just check this and then call the function with the `new` keyword from inside the function.

```javascript
function Account(name) {
  if (Account.prototype.isPrototypeOf(this)) {
    this.name = name;
  } else {
    return new Account(name);
  }
}

function EliteAccount(name) {
  if (EliteAccount.prototype.isPrototypeOf(this)) {
    Account.call(this, name);
    this.status = 'vip';
  } else {
    return new EliteAccount(name);
  }
}

EliteAccount.prototype = Object.create(Account.prototype);
EliteAccount.prototype.constructor = EliteAccount;

let accA = Account('Mr. Snail')
let eliteA = EliteAccount('Mr. Dolphin');

console.log(accA);
console.log(eliteA);
```

## Patterns of Behavior Delegation (Prototypal)
It is all prototypal in JS, but the there are different kinds of patterns we can follow:
1.[Pseudo-classical](pseudo_classical_pattern.md): When you make use of the protypal pattern with the constructor pattern, then you get pseudo-classical
1. [OLOO](OLOO.md): When you make use of the protypal pattern without resorting to the constructor function, then you get OLOO pattern.