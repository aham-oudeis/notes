In larger applications, there are multiple reducers responsible for altering different parts of the global state. In such cases, we need a way to dispatch actions to multiple reducers. 

The way to do this is to send actions to all the reducers and let the reducer designed to handle the action do the work. All the other reducers only return the state.

For example, a relatively simple app that needs to keep track of all the notes and filter it depending on the user's selection of filter would require us to have a state that may look like this:

```javascript
{
	notes: [
		{ content: 'reducer defines how redux store works', important: true, id:1 },
		{ content: 'state of store can contain any data', important: false, id: 2}
	],
		filter: 'IMPORTANT'
}
```

Each reducer is responsible for the corresponding property of the store object. When the reducer is initialized, then the corresponding state is also initialized on the store object. For this, we need to use the  `combineReducers` function from `redux`

Basically, `combineReducers` is a function that takes in the objects with functions and returns a function that when executed, runs all the functions passed to it. (this is just a hypothesis, not sure if it's true)

![[Pasted image 20220726110510.png]]

when `createStore` is passed in the combined reducers, then it initializes the store object based on the properties of the object passed to the `combineReducers`

> The combined reducer works in such a way that every _action_ gets handled in _every_ part of the combined reducer. Typically only one reducer is interested in any given action, but there are situations where multiple reducers change their respective parts of the state based on the same action.

`useSelector` returns the global state. To access the specific property, we need to use that property.

[[redux-toolkit]]