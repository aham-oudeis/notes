# Static Methods

Properties defined on the constructor are called static properties. 

Properties that pertain to the type is stored as static property.

One use of static property is to use it to keep a running collection of all the object created from the constructor. For example:

```javascript
function Cat(name) {
  this.name = name;
}

let mitthu = new Cat('Mitthu');
let pepper = new Cat('Pepper');
let pumpkin = new Cat('Pumpkin');
```

If we wanted to find out all the instances of cat created from the constructor function, then there is no way but to count the instances in the code. 

We can keep a running collection of the instances in an array and store it as a property on the `Cat` function.


```javascript
function Cat(name) {
  Cat.allInstances.push(this);
  this.name = name;
}

Cat.allInstances = [];

let mitthu = new Cat('Mitthu');
let pepper = new Cat('Pepper');
let pumpkin = new Cat('Pumpkin');

console.log(Cat.allInstances);
```

We can also functions as the static properties. They are called `static methods`.

Examples: `Object.assign`, `Number.isNaN`, `Array.isArray` are all static methods.