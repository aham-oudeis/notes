# Relationship between constructor and instanceof operator

Consider the following example:

```javascript
function Cat(name, breed, color) {
  this.name = name;
  this.breed = breed;
  this.color = color;
}

let pumpkin = new Cat('Pumpkin', 'Persian', 'Orange and White');
let pepper = new Cat('Pepper', 'American Short Hair', 'Black and White');
let mitthu = new Cat('Mitthu', 'American Short hair', 'White and Tabby');

//here the prototype of the cat objects is the object referenced 
//by the prototype property of the Cat function
Cat.prototype;

console.log(mitthu instanceof Cat); // true
console.log(mitthu.constructor === Cat); //true

//however, if we change the constructor of mittu to something else
//the instanceof operator still shows the same result
mitthu.constructor = function() {};

console.log(mitthu instanceof Cat); // true
console.log(mitthu.constructor === Cat); //false

//we could even change the constructor property of the object referenced by Cat.prototype

Cat.prototype.constructor = function() {};
console.log(mitthu instanceof Cat); // true
console.log(mitthu.constructor === Cat); //false

Cat.prototype = {};
console.log(mitthu instanceof Cat); // false
console.log(mitthu.constructor === Cat); //false
```

When we invoke the `instanceof` operator, JS checks whether the object referenced by the `prototype` property of the constructor is one of the objects in the prototype chain of the object. Changing the `constructor` property does not affect how JS checks the prototype of the object.

However, if you resassign the `prototype` property of the constructor to a different object that is not among the objects in the prototype chain, then the `instanceof` operator returns `false`.

Basically, `constructor` property of an object by default referenes the function that is resposible for creating the object. While using object literal, the `constructor` property refers to the `Object` function that is responsible for creating objects.

```javascript
let Cat = {
  meow() {
    console.log('I want food!');
  }
}

let mitthu = Object.create(Cat);

console.log(mitthu.constructor === Cat.constructor);
```

When the `Cat` object is created using an object literal, the object is constructed using the `Object` function and hence the `Cat` object inherits from the `Object.prototype` and the constructor property of the object `Object.prototype` points to the `Object` function. Hence, the constructor property of both `Cat` object and `mitthu` object references `Object`.