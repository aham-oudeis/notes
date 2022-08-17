# Objects

* Objects store a collection of key-value pairs: values are associated with keys.
* Key-value pairs are also called properties.
* Objects' keys are strings, but values can be of any type.
* Specific values can be accessed with either (1) dot notation, or (2) bracket notation
* Objects can [__inherit__ from other objects](#prototype)
* If the named property exists, assignment updates the property's value
* `delete` keyword can delete properties from objects

## Varieties of Objects 
1. Simple objects `{}`
2. Arrays
3. Dates
4. Functions
5. Any other custom objects


## Prototype

```js
let freshmen = { name: undefined, age: undefined, enrolled: true, classes: [] };
// freshmen is the parent object
// bob is the child object
let bob = Object.create(freshmen);

bob.name = "Bob";
bob.age = 19;
```
## Iteration

```js
let person = {
  name: 'Bob',
  age: 30,
  height: '6 ft'
};

// for/in iterates over the inherited properties as well
// if we want to iterate only over the object's own property,
// we have to use the 'hasOwnProperty' method or 'Object.keys' method
for (let detail in person) {
  // we can't use dot notation below, because detail is a variable 
  // that contains a property name and not a property name
  console.log(person[detail]);
}

for (let value of person) {
  console.log(value);
}
```

## Common Operations
1. `Object.values(obj)`
2. `Object.entries(obj)`
3. `Object.assign(obj1, obj2)`: mutates the first object, i.e., `obj1`