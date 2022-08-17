## Objects Linking to Other Objects

This approach was popularized by Kyle Simpson. 

Instead of trying to make objects creation mimic the classical way of creating objects, we can simply think in terms of property sharing by relying on the idea that objects are simply prototypes of other objects.

In order to do this, we collect the shared properties and behaviors in an object and create new objects using it as a prototype.

```javascript
let Bike = {
	speed() {
    console.log('Speeding!');			
	},
	slow() {
		console.log('Slowing Down!')
	},
}

let mountainBike = Object.create(Bike);

console.log(Bike.isPrototypeOf(mountainBike));
```