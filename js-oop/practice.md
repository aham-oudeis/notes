## Q1:
The code logs `undefined` to the console, because:
1. when the `log` function method is invoked on the `boat` object, it invokes the function `whatIsThis` with the value of `this` set to the `boat` object. This is because the `whatIsThis` function is stored in the `log` property of the `boat` object. 
2. But, the `whatIsThis` invokes the `thisIsWhat` function as a function. Since the function is invoked without the calling object, JS sets the value of `this` to `undefined` (because the code is running on strict mode) inside the function.
3. Hence, the `console.log(this)` logs `undefined`.

```javascript
console.log("hello world!")
```

## Q2:
The value of `this` is based on lexical scope only for arrow functions. But for functions declarations and function expressions, the value of `this` is set at the time of invocation.

Basically, when a function is invoked without a receiver/caller, then the implicit binding of the function is the window object. 

```javascript
function test() {
  return this;
}

test(); // return the global object
```

When a function is invoked in this way, JS sets the value of `this` to the global object.

However, when a function is invoked on some object, i.e. as a method, the value of `this` is set to the receiver or calling object.

```javascript
let obj = {
	test() {
		return this; 	
	},
}

obj.test(); // returns the obj itself
```
But, when the function is not invoked with an explicit caller, the value of `this` is changed to the global object.

```javascript
let obj = {
	test() {
		return this; 	
	},
}

obj.test(); // 

let outsideTest = obj.test; // assign the function to a new variable

outsideTest(); // returns the global object

```
Another example:

```javascript
let obj = {
	test() {
    function anotherTest() {
      console.log(this);
    }

    //function is invoked without an explicit caller
    //hence, the value of this is set to the global object inside the function
    return anotherTest();
	},
}

obj.test(); // logs the global object, i.e. Window {...}
```

Since the value of `this` does not depend on where the function is defined but how the function is invoked, the value of `this` is not based on lexical scope.

But things are different with arrow functions:


```javascript
let obj = {
	test() {
    const anotherTest = () => {
      console.log(this);
    }

    //function is invoked without an explicit caller
    //but since it is an arrow function, it inherits the value of this from its lexical scope
    //hence, it logs the obj
    return anotherTest();
	},
}

obj.test(); // logs the object referenced by obj 
```

## Q3:
`bind` method is a method available on functions that allows us permanently set the value of `this` for the function. 

For example:

```javascript
let obj = {
  a: 'hello',
  greet() {
    console.log(this.a);
  }
}

const boundGreet = obj.greet.bind(obj);

let another = {
  a: 'Namaste',
  greet: boundGreet
}

another.greet(); // logs 'hello' even though the we are calling the greet method on the `another` object
```

What `bind` does is returns a function which when invoked calls the original function is the value of `this` set to the argument that was passed in. 

Here is how the bind method might be defined:

```javascript
Function.prototype.bind = function (...args) {
	// extract the first argument that is to be used as the value of this
	let thisArg = args.shift();
	
	//since functions are objects, calling a bind method on a function would 
	// set the value of this to the function object. we extract the function 
	// with the this keyword
	let funcToBeInvoked = this;
	
	return function (...rest) {
		//call the function with prefilled arguments and 
		//then the arguments that are passed 
		return funcToBeInvoked.call(thisArg, ...args, ...rest);
	}
}

```


## Q4:

```javascript
function logMyName() {
  console.log(this.name);
}

let personBetty = {
  name: 'Betty',
  logger: logMyName,
}

personBetty.logger();
```


## Q5:
The value of `this` on line 4 will be the object referenced by `foo` variable, because:
1. when `init` method is invoked on `bar` object, it calls the `init` method on `foo` object.
2. since `init` is called on `foo` object, the value of `this` inside the `init` function is `foo`. Hence, `this.qux()` amounts to calling the `qux` method on `foo` object.
3. Since `qux` is called on the `foo` object, the value of `this` inside `qux` is set to `foo`.
4. Hence, the value of `this` on line 4 will be the object referenced by the `foo` variable.

```javascript

```


## Q6:


```javascript
let foo = {
  letters: ['a', 'b', 'c', 'd', 'e'],
  qux() {
    const makeUpperCase = (function(letter, idx) {
      this.letters[idx] = letter.toUpperCase();
    }).bind(this);
    
    this.letters.forEach(makeUpperCase);
  }
};

foo.letters;  // returns `['a', 'b', 'c', 'd', 'e']`
foo.qux()     // returns `undefined`
foo.letters;  // returns `['A', 'B', 'C', 'D', 'E']`
```


## Q7:


```javascript
function orderCreator(customer, item, quantity, price) {
  return {
    customer,
    item,
    quantity,
    price,
    quantityString() {
      return String(this.quantity)
    },
    computeValue() {
      return this.quantity * this.price;
    }
  }
}

function printOrderDetails(...orders) {
  const ordersTotal = orders.reduce((totalValue, order) => {
    return totalValue += order.computeValue();
  }, 0);

  const orderQuantity = orders.reduce((totalQuantity, order) => {
    return totalQuantity += order.quantity;
  }, 0);

  orders.forEach(order => {
    console.log(`${order.customer} ordered ${order.quantityString()}` +
                ` of ${order.item} for $${order.price}`);
  });

  console.log('---');
  console.log(`Total quantity of orders is: ${orderQuantity}`);
  console.log(`Total value of orders is: $${ordersTotal}`);
}

let order1 = orderCreator('Victor', 'Pie', 2, 3)
let order2 = orderCreator('Pete', 'Apple', 1, 5)
let order3 = orderCreator('Victor', 'Banana', 3, 2)
printOrderDetails(order1, order2, order3)
```


## Q8:
The variable `victor` references the object returned by the factory function defined in line 1-9. The object that `victor` references has a `fullName` method that returns only the string containing the values of the `firstName` and `lastName` properties of the object. 

So, when on line 23 the `fullName` method is invoked on the `victor` object, it returns `Victor Reyes`. Hence, testing the string against `'My fullname is Victor Reyes'` returns false, because they are two different strings.

The factory function defined in line 13-21 is not used.

```javascript

```


## Q9:
- They are functions (generator) that return a function (applicator) that calls another function (primary function) with some of the arguments from the closures.
- they are used to reduce the number of arguments needed to supply
- partial functions applications are made possible by twin concepts: (1)closures where some of the arguments are stored, (2) and functions are first class objects in JS, so that we can use functions as objects that can be a stored in an array, passed to a function, and returned from a function.

```javascript
function execParams(database, sql, params) {
  // say this function connects to the database
  // then runs the sql query on that database with the supplied params
}

//suppose there are two different databases you're working with: waterDatabase and fireDatabase
// we can create a partial function that returns a function with the database as its local variable
// and returns another function that calls the execParams function with all the required arguments

const sqlWithParams = function (database) {
  return function (sql, params) {
    return execParams(database, sql, params)
  }
}

let fireDatabase = 'some fire database';
let waterDatabase = 'some water database';

// in the following code, return distinct function objects each of which has a `database` variable
// initialized to the argument provided with the function invocation
// we can then rely on that anonymous function to take care of the providing the correct number of
// arguments when it invokes the execParams function 

const execParamsOnFire = sqlWithParams(fireDatabase);
const execParamsOnWater = sqlWithParams(waterDatabase);

execParamsOnFire('SELECT * FROM users;', []);
execParamsOnFire('SELECT * FROM missles;', []);
```


## Q10:


```javascript

```


## Q11:
- Functions that we define and invoke immediately
- These are useful when we have to create a local scope to go through some steps. They are useful for creating private data.
- Sometimes, while working with a large codebase, it is safer to work with a local scope than creating new variables in the main scope.
- This can be done in two ways: either we return a function that has access to the private data or we return an object with methods that retain access to the private data. (It's the methods that retain access to the private data.)

```javascript
let counter = (function () {
	count = 0;
  return function() {
    count += 1;
    return count;
  }
})();

counter(); 
counter();
```

Here, to create a `count` variable in a way that does not conflict with other variables of the same name in the rest of the codebase, we can use IIFE

```javascript

```


## Q12:
- Functions that either take a function as an argument or return a function are called higher order functions. 
- This is possible in JS because functions are first class citizens in JS

Hence, the variable `makeTodoList` is assigned to the return value of invoking an IIFE. The IIFE is a higher order function, because it returns a function. This returned function is stored in the `makeTodoList` variable. Since the function stored in the `makeTodoList` variable neither takes a function as its argument nor returns a function (it returns an object), it is not a higher order function.


```javascript

```


## Q13:
Review this:

The provided code does not produce the expected output because:
1. the function stored in `makeTodoList` has access to the array referenced by `list`.
2. When `makeTodoList` is invoked, it returns an object who methods have access to the array referenced by `list` from the `makeTodoList`'s closure.
3. Hence, although the intent in line 16 and 20 is to create an object whose methods have access to a different way, this is not what happens. Methods in the two distinct object retains access to the same array referenced by `list`.

What we want is a `list` array to be accessible to the methods of each todo object we create. To correct this, we have to create new closure object for the methods contained in the object returned by calling the `makeTodoList` function. Hence, we can change the code as follows to get the desired result.

```javascript
let makeTodoList = (() => {
  return () => {
    let list = [];

    return {
      add(item) {
        list.push(item);
      },
      display() {
        list.forEach(item => console.log(item));
      }
    };
  };
})();

let fooList = makeTodoList();
fooList.add('foo item1');
fooList.add('foo item2');

let barList = makeTodoList();
barList.add('bar item1');

barList.display();
//logs bar item1
```


## Q14:

could use `arguments.length` as well:

```javascript
function makeSerialCounter() {
  let seed = 0;
  
  return function(seedValue) {
    if (seedValue === undefined) {
      return seed++;
    } else {
      seed = seedValue;
      return seed++;
    }
  }
}
```


## Q15:
If we want to implement a system that allows for some kind of property sharing or behavior sharing, we need at least two main ingredients:
1. A container or repository for shared behaviors
2. A mechanism for looking up the next repository

In JS, objects are the repository for the shared behaviors. Each object in JS has a `[[Prototype]]` property that points to a respository where the object can find methods. This repository object is called the **prototype of an object** or **object prototype**. Likewise, the prototype object can itself has a `[[Prototype]]` property that points to another repository. This mechanism for connecting objects with their prototypes is called a prototype chain. At the end of the chain, lies `null`.

```javascript
let Dog = {
  bark() {
    console.log('bark');
  }
};

let pitbull = Object.create(Dog);

console.log(Object.getPrototypeOf(pitbull) === Dog); //true

//prototype of Dog is the object referenced by Object.prototype
console.log(Object.getPrototypeOf(Dog) === Object.prototype);

//the chain ends with null
console.log(Object.getPrototypeOf(Object.prototype))
```


## Q16:
The two caveats are:
1. All code in `class` runs in strict mode
2. Invoking the class constructor without the `new` keyword throws an error

```javascript

```


## 17:


```javascript
'strict mode';

function Person(name) {
  if (this instanceof Person) {
    this.name = name;
  } else {
    //although class syntax throws an error if new keyword is ommitted
    //i've made it scope safe
    return new Person(name);
  }
}

Person.describe = function() {
  return 'This creates a person object with a name.';
}


Person.prototype.logName = function() {
  return `This person's name is ${this.name}.`;
}

let betty = Person('betty');

Person.describe();
//betty.logName();
```


## Q18:

All functions have the default `prototype` property. This `prototype` property is used when the function is invoked as a constructor.

This `prototype` property is something a function has in its role as a creator of object. When the function is not used in the role of creator of objects, then this property is not used. But when the function is used in the role of creation of objects, the object referenced by this property becomes the prototype of the object created by the function.

That is, functions can be used to do two things at once: create an object from the object referenced by its `prototype` property and return this newly minted object. That is , the function can play the role of creating an object and and the role of storing the repository of the shared behaviors.

When the functions play this double role, they are called constructor functions or **constructors**. (However, we can also use the constructor functions without relying on the function's prototype property.) To distinguish between ordinary functions that are not used in the role of constructors, the naming convention is to write the function name in Pascal Case, i.e, capitalizing all the first letters.

```javascript
function Person(name, alive = true) {
  this.name = name;
  this.alive = alive;
}

Person.prototype.greet = function () {
  console.log(`${this.name} says hello to you!`);
}

let bob = new Person('Bob Deer');

bob.greet();
//the object referenced by this property becomes the prototype of 
//the object created by the function.
console.log(Object.getPrototypeOf(bob) === Person.prototype);
```


## Q19:
The highlighted portion of the code is not producing the desired output because:
1. on line 19, the `prototype` property of the `FastVehicle` is set to the same object that `Vehicle.prototype` points to. 
2. Hence, when on line 22, an `accelerate` method is defined on `FastVehicle.prototype`, the method is defined on the object that `Vehicle.prototype` references. Hence, the previous `accelerate` method defined on line 7-9 is overridden. 
3. Hence, when on line 28, `accelerate` method is invoked on `oldVehicle` it increases the speed by 5, rather than by 1 as the method on line 7-9 expected. 

The key thing to do is set the prototype of `FastVehicle.prototype` to be the object referenced by `Vehicle.prototype`. 

The following code amends the error:
```javascript
function Vehicle(make, model) {
  this.make = make;
  this.model = model;
  this.speed = 0;
}

Vehicle.prototype.accelerate = function() {
  this.speed += 1;
};

Vehicle.prototype.stop = function() {
  this.speed = 0;
}

function FastVehicle(make, model) {
  Vehicle.call(this, make, model);
}

FastVehicle.prototype = Object.create(Vehicle.prototype);
FastVehicle.prototype.constructor = FastVehicle;

FastVehicle.prototype.accelerate = function() {
  this.speed += 5;
}

let oldVehicle = new Vehicle('Datsun', 'B210');
let newVehicle = new FastVehicle('Tesla', 'P90D');
oldVehicle.accelerate();
oldVehicle.speed;  // returns 5; should return 1
newVehicle.accelerate();
newVehicle.speed;  // returns 5
newVehicle.stop();
newVehicle.speed;  // returns 0
```


## Q20:


```javascript

```


## Q21:


```javascript

```


## Q22:


```javascript

```


