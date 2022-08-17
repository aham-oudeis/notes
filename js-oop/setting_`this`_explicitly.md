Javscript allows us to set the value of `this` explicitly when calling a method. 

```javascript
let obj = {
	a: 'greetings, ',
	b: 'my friend!'
}

function test() {
	return this.a + this.b;
}

var a = 'hello, ';
var b = 'child!';

test(); // hello, child!
test.call(); // hello, child!
test.call(obj); // greetings, my friend!
```

Likewise, we can use `apply` to explicitly set the value of `this`.

```javascript
let obj = {
	a: 'greetings, ',
	b: 'my friend!'
}

function test() {
	return this.a + this.b;
}

var a = 'hello, ';
var b = 'child!';

test(); // hello, child!
test.apply(); // hello, child!
test.apply(obj); // greetings, my friend!
```

The main difference between `call` and `apply` is that when arguments are passed in, `apply` takes an array of arguments, whereas `call` takes the arguments one after the other. 

```javascript
let obj = {
	a: 'greetings, ',
	b: 'my friend '
}

function test(name) {
	return this.a + this.b + name;
}

var a = 'hello, ';
var b = 'child ';

test('Karim'); // hello, child Karim
test.call(obj, "Karim");

test.apply(obj, ['Karim']); //you will get an error if you omit the array
```
[[bound_Function]]