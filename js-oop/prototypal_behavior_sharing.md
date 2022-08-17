## Basics of Behavior Sharing

### Ingredients
If we want to implement a system that allows for some kind of property sharing or behavior sharing, we need at least two main ingredients:
1. A container or repository for shared behaviors
2. A mechanism for looking up the next repository

It's like just any other sharing practice. If you're familiar with either car share or bike share, you know that to access a car or a bike, you need to know the location where these bikes or cars are stored. If there was no systematic way of locating the shared resource, sharing would not be feasible. It is no different in programming.

Say, there are two objects A and B inside a program, and all the common behaviors between A and B are stored in some repository C. 

To implement a system such that both A and B can access the behaviors contained in C, we need some system for looking for the behaviors in A or B and if we cannot find it there, we can go looking in the next repository. We can implement this by adding some information in both A and B, such that that information points to the next repository to search. Say, both A and B has a property, source, such that the property points to C. 

Now we have the basic ingredients for property sharing. A and B can share all the properties contained in C. Likewise, C can have another 'source' property pointing to another repository if the desired behavior is not found in C. 

### How JS allows behavior sharing
How does JS makes these two ingredients available? 
1. Unlike other languages that use classes as a repository, in JS objects themselves are the repository for shared behaviors.
   > When it comes to inheritance, JavaScript only has one construct: objects. Each object has a private property which holds a link to another object called its **prototype**. That prototype object has a prototype of its own, and so on until an object is reached with `null` as its prototype. By definition, `null` has no prototype, and acts as the final link in this **prototype chain**.
3. JS provides a hidden `[[Prototype]]` property on each object that points to the repository of shared behaviors available for that object.

To access the object that the `[[Prototype]]` property points to, we can use a method `Object.getPrototypeOf(obj)`. Although this `[[Prototype]]` is not directly accesssible, we can rely on a deprecated feature: `__proto__` to access the repository. Let's see how that works:

```javascript
let obj = {};
let arr = [];

console.log(Object.getPrototypeOf(obj));
console.log(Object.getPrototypeOf(arr));

console.log(Object.getPrototypeOf(obj) === obj.__proto__); // true
console.log(Object.getPrototypeOf(arr) === arr.__proto__); // true
```
 
 The repository that `[[Prototype]]` points to is called the **prototype of an object** or **object prototype**.  At the end of the chain,  `[[Prototype]]`  points to `null`.  That marks the end of the prototype chain.

Let's see how we can connect a repository with the objects using these components so far:

```javascript
const Repository = {
  speedUp() {
    console.log("I am speeding!")
  },
  slowDown() {
    console.log("I am slowing down");
  },
};

let bikeA = {}; // creates an empty object
let bikeB = {};

// prototype of both bikeA and bikeB is a repository of methods
// available to all objects, including the repository
// when we use object literal notation, the prototype of the object is set
// the object referenced by the `prototype` property of the `Object` function
// hence the following code logs true
console.log(Object.getPrototypeOf(bikeA) === Object.getPrototypeOf(Repository));
bikeA.speedUp; // undefined

//let's change the prototype of both bikeA and bikeB
//Javascript allows us to change the prototype of an object to another object
//warning: setPrototypeOf is a rather slow function
Object.setPrototypeOf(bikeA, Repository);
Object.setPrototypeOf(bikeB, Repository);

// returns the object that Repository points to
console.log(Object.getPrototypeOf(bikeA)); 
console.log(Object.getPrototypeOf(bikeA));

//now when JS does not find the speedUp method in the object, it looks in 
//its prototype, i.e., Repository, and finds it there.
bikeA.speedUp; // returns a function 
bikeA.speedUp();
bikeA.SlowDown();
```

Notice, we need to go through a sequence of steps to forge a connection between the object and its prototype:
1. create an object
2. Set its `[[Prototype]]` property to point to the repository

This sequence of steps can be easily put into a method that we can invoke to get the newly minted object.

```javascript
const mintBike = function(repository) {
	let obj = {};
	Object.setPrototypeOf(obj, Repository);

	return obj;
}
```

### Capitalizing JS features
Now we have a pretty basic model for creating objects that share behaviors from a common repository. 

But JS allows us to streamline this process even more. For that we need two pieces of information:
1. Javascript functions are objects and hence can contain reference to the repository
2. Javascript makes that repository available through the function property `prototype`

All functions have this default `prototype` property. We'll explore this, but let's clarify something that might be a bit confusing.

Since functions are objects, they also have the default `[[Prototype]]` property. The `[[Prototype]]` property of a function references the native function with which the current function is related as an object. The property `[[Prototype]]`is something the function has in its role as an object.

Back to the `prototype` property. This `prototype` property is something a function has in its role as a creator of object. When the function is not used in the role of creator of objects, then this property is not used. But when the function is used in the role of creation of objects, this property is used to reference the repository for shared behaviors.

That is, what used to be an external repository can be moved inside the function object and the same function can do double-duty: create an object and set up the prototypal chain. That is , the function can play the role of creating an object and and the role of storing the repository of the shared behaviors.

When the functions play this double role, they are called constructor functions or **constructors**. (However, we can use the constructor functions without relying on the function's prototype property.) To distinguish between ordinary functions that are not used in the role of constructors, the naming convention is to write the function name in Pascal Case, i.e, capitalizing all the first letters.

Aside: all objects have their corresponding constructor functions. Even strings and numbers have their corresponding constructor functions. `obj.constructor` gives you the function that constructed the obj. This `constructor` property is stored in the object referenced by the `prototype` property of the constructor function. Hence, when we try to find the `constructor` property on an object, it returns the value stored in the `contructor` property of the object referenced by the `prototype` property of the function that created the object.

```javascript
function Bikes() {
	let obj = {};
	
	// instead of an external repository, we use the repository acessible 
	// using the prototype property of the function
	Object.setPrototypeOf(obj, Bikes.prototype);

	return obj;
}

let bikeA = Bikes();

console.log(Object.getPrototypeOf(bikeA) === Bikes.prototype)
```

This is not the end of it. JS allows us to simplify this whole process even further. All the code involved in creating an object, setting its prototype to the repository, and returning the object can be trigged with the use of the `new` keyword.

That is, the above code can be replaced as:

```javascript
function Bikes() {
}

let bikeA = new Bikes();
console.log(Object.getPrototypeOf(bikeA) === Bikes.prototype)
```

That's what the `new` keyword does under the hood. See [how new keyword works](object_creation.md#constructor-pattern)

[[pseudo_classical_pattern]]
[[OLOO]]