# Prototype pattern
Pseudo classical pattern is simply a way of creating objects while mimicking some of the features of the classical pattern of creating objects using classes. 

```javascript
function Bike(size) {
	//state is initialized inside the constructor function
	this.size = size;
}

Bike.prototype.speedUp = function() {
	console.log('Speeding!')
}

let bikeA = new Bike('medium');
```

Or, we could rely on JS's syntactic sugar and go full classical:

```javascript
class Bike {
	constructor(size) {
		this.size = size;
	}
	
	speedUp() {
		console.log("Speeding!")
	}
}

let bikeA = new Bike('medium');
```

