# concise syntax
```javascript
let obj = {
	callMe() {
		console.log('calling, calling');
	}
}
```

The fact that we don't have to use a function expression inside the object makes it a rather concise syntax. Otherwise, we'd have to write:

```javascript
let obj = {
	callMe: function() {
		console.log('calling, calling');
	}
}
```

