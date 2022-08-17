# Class Syntax

class syntax is simply a syntactic sugar that masks the underlying prototypal nature of OOP in javascript.

- Class syntax requires a `constructor` method to initialize the state of the object.

One nice thing about the class syntax is that it makes it rather easy to have private property. All you have to do is add `#` at the beginning of the property. Since the private property is enforced by JS, the class syntax seems to be more than just a syntactic sugar.

```javascript
class Account {
  #password;
  
  constructor(username, password) {
    this.username = username;
    this.#password = password;
  }

  balance(password) {
    return password === this.#password ? 1500 : 'Invalid Password';
  }

  #privateStuff() {
    return 'This is a private method!';
  }

  seePrivate() {
    return this.#privateStuff();
  }
}

let userA = new Account('someone', 'none');
console.log(userA.username);
console.log(userA.balance('hello'));

console.log(userA.seePrivate());

//the following code throws an error, bc the method is private
console.log(userA.#privateStuff())
```

To add static properties on the class we have preface the property with `static` keyword;

```javascript
class Account {
  static location = 'Nowhere';

  static bank() {
    console.log('Anonymous Bank');
  }
}

console.log(Account.location)
console.log(Account.bank());
```

Caveats:
1. Parameters are defined and states are set within the constructor function, which runs automatically when an object is created
2. All code in `class` runs in strict mode
3. Invoking the class constructor without the `new` keyword throws an error
4. All methods (except the `constructor` and methods prefaced with `static`) defined within the `class` definition are defined on the prototype object. 
5. static methods are inherited

## Inheritance using class syntax

Caveat: Must call `super` before using the `this` keyword for setting state

```javascript
class Animal {
  constructor(name, predator) {
    this.name = name;
    this.predator = predator;
  }

  sleep() {
    console.log(this.name, 'is sleeping!');
  }
}

class Cat extends Animal {
  constructor(name, predator, breed) {
    super(name, predator);
    this.breed = breed;
  }
}

class Dog extends Animal {
  constructor(name, predator, breed, size) {
    super(name, predator);
    this.breed = breed;
    this.size = size;
  }
}

let mitthu = new Cat('Mitthu', true, 'Persian', 'small');
let velvet = new Dog('Velvet', false, 'Great Dane', 'large');
console.log(mitthu.sleep());
console.log(velvet.breed);
console.log(velvet.sleep());
```