## Object Factories

- An object is a tool for bundling data with behaviors
- When we have to work with multitude of objects with same set of behaviors, it is tedious to create a new object every time we need one.
- Creating a new object everytime in this manner would violate the DRY principle
- Functions can be used to create objects that have the same set of behaviors

For example, consider this following code:

```javascript
let sedan = {
  speed: 0,
  rate: 8,
  accelerate() {
    this.speed += this.rate;
  },
};

let coupe = {
  speed: 0,
  rate: 12,
  accelerate() {
    this.speed += this.rate;
  },
};
```

Here, two objects with the same behavior is created with slightly different initial state. We can easily move this into a function:

```javascript
function makeCar(rate) {
	return {
		speed: 0,
		rate,
		accelerate() {
			this.speed += this.rate;
		}
	}
}

let sedan = makeCar(8);
let coupe = makeCar(12);
```

This usage of function in creating objects can be called a **object factory**. 

This approach has the benefit of dispensing with the reliance on inheritance or behavior delegation. Alll objects contain every behavior they are supposed to have, excepting the behaviors they inherit from `Object.prototype`. This makes it possible to have objects that are tamper-proof, by storing values in the closures created by the function. However, this reliance on closures rules out the possibility of adding methods to the object that have access to the variable inside the closure.

The downside of this approach is that it is rather resource-intensive, because all the objects carry their behaviors with them instead of delegating to some other object.

Second downside is that the objects do not carry information about which function created the object. However, this issue could easily be resolved by changing the constructor property of the object within the factory function:

```javascript
function makeCar(rate) {
  let car = {
		speed: 0,
		rate,
		accelerate() {
			this.speed += this.rate;
		},
	  }

  car.constructor = makeCar;

  return car;
}

let sedan = makeCar(8);
console.log(sedan.constructor);
```

Since `instanceof` operator is used to figure out if the object is an instance of the given constructor function, merely changing the `constructor` property of the object is not going to yield the correct result. This is because the `instanceof` operator checks if the object referenced by the `prototype` property of the function is a prototype of the given object. Merely changing the `constructor` property is not enough. But if we change enough things to get the correct result, the function becomes a constructor rather than just an object factory. 