# Syntactic Sugar

## Concise Property Initializers

```js
let peterDetails = ['Peter Pan', 44, 'Hillside in Vermont', '901-283-2837'];

//suppose we have lots of personDetails like this
//we want to create an object from such array data

function personObject(name, age, address, number) {
  return {
    name: name,
    age: age,
    address: address,
    number: number,
  }
}

//however JS provides a simpler syntax to do this:

function personObject(name, age, address, number) {
  return {
    name,
    age,
    address,
    number,
  }
}

// we can do this to get the proper person object details

let peter = personObject(...peterDetails);

peter;
// {
  name: 'Peter Pan',
  age: 44,
  address: 'Hillside in Vermont',
  number: '901-283-2837'
}
```

## Object Destructuring

This feature allows us to initialize a lot of variables of the same name as the keys of the object:

```js
let peter = {
  fullName: 'Peter Pan',
  age: 44,
  address: 'Hillside in Vermont',
  number: '901-283-2837'
};

// while we could accomplish the task in a tedious way as follows:
let fullName = peter.fullName;
//and so on
// But there is simpler way:

let {fullName, age, address, number} = peter;

//or, we can also change the name of the variable
let {fullName: name, age, address: homeAddress, number} = peter;

// we can also use this with function parameters

function printDetails({name, address, number}) {
  console.log("I am " + name + ".");
  console.log("I live in " + address + ".");
  console.log("You can reach me at " + number + ".");
}

printDetails(peter);
```

A bit of care is needed, when variables are not declared but simply assigned:
```js
{name, address, number} = peter; // throws an error because {} starts a block

//solution is to put the whole thing in parentheses

({name, address, number} = peter);
```

## Rest Syntax

The __rest syntax__ collects multiple items into an array or object.

It is most used when working with functions that take an arbitrary number of arguments. 

```js
let nums = [1, 2, 3, 4, 5];
let [firstElement, ...restElements] = nums;

//note that the left-hand side looks like an array but it is actualy array destructuring syntax

//firstElement is initialized to 1 and the rest of the elements is collected into 
// an array and assigned to the variable restElements

console.log(firstElement);
console.log(restElements);
```

## Spread Syntax

The __spread syntax__ is used to 'spread' the elements of an array or object into separate items.

```js
function add(arg1, arg2, arg3, arg4) {
  return arg1 + arg2 + arg3 + arg4;
}

let nums = [1, 2, 3, 4];

// the spread syntax allows us to supply the array element in nums as separate items

add(...nums)
```

The spread syntax can be used to copy the elements of an array or to concatanate arrays.