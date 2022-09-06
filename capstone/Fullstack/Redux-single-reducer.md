### Flux architecture
As the application grows more complex, managing the state of the application becomes a serious issue. Jam packing all the state initialization in the main app component is not feasible.

To deal with this, facebook dealt with this by designing flux architecture.

![[Pasted image 20220721124101.png]]

### Key Steps
1. `createStore` takes the reducer function as an argument and returns a store object.
2. the store object has `dispatch`, `getState`, and `subscribe` methods available for manipulating and responding to the state change.
3. Given that the state change is tracked by checking the memory location of the state, the reducer must be returning a new state. That is, the reducer must be a pure function.

While the basic idea is simple, implementing these ideas on a complex project requires thinking about separating the domains of responsibility. We can divide the job into the following parts:

- __action creators__: functions responsible for generating correct action objects
- __reducer__
- __store__

### Install redux
```
npm install redux
```

Main points:
- the state is stored in a store
- the whole state of the application is stored in one JS object in the store.
- the state of the store is changed with actions, which are objects with at least a field for determinign the __type__ of the action
- the impact of the action to the state is defined using a __reducer__, which is a function that takes the state and action as arguments and returns a new state.  For example:

```javascript
const counterReducer = (state, action) => {
	if (action.type === 'INCREMENT') {
		return state + 1
	} else if ( action.type == 'DECREMENT') {
		return state - 1
	} else if (action.type === 'ZERO') {
		return 0
	}

	return state
}
```

`switch` state is more common for reducers.

- Reducer is never suposed to be called directly from the applications code. Reducer is passed in as an argument to the `createStore` function that creates the store. The store returned by the `createStore` is used for updating the state using `dispatch` method. Or, use the `getState` method to get the state. 

Example:
```javascript
import { createStore } from 'redux'

const counterReducer = (state = 0, action) => {
//...
}

const store = createStore(counterReducer)

/*
.
.
.
*/

store.dispatch({ type: 'INCREMENT'})
```


### `store.subscribe`
This is the method for executing a function any time some value in the store changes

One question I have is how to manage the state when there are multiple states to be managed. .... Turns out, the problem is resolved by passing the action object to all the reducers and setting up the reducers so that they alter the state based on the relevant action type.

Core solution offered by Redux is of having a central location for altering the state. From whatever location, one can send some data to the store. And the store is designed to change the internal state. The function responsible for how the state is changed based on which event type it receives is called the reducer. 

When some value on the store is changed, the app can be rendered again by setting up the store so that the app is re-rendered.

### Making store available to various components
`npm install react-redux`

Once the store is initialized at the top level, how can one make it available to all the other components?

This is where the `import { Provider } from react-redux` comes handy. It takes the store as a prop and then makes it available to all the components that are in its scope.

Example:
![[Pasted image 20220726102737.png]]

### `useDispatch` and `useSelector`
The `useDispatch` hook provides any react component access to the dispatch-function of the redux store defined in the index.js file. That is, the `useDispatch` internally has access to the store object initialized with the `createStore` method and returns that dispatch method. The returned `dispatch` method can be stored in a variable and used in the code. No need to call `store.dispatch`: the hook takes care of that.

![[Pasted image 20220726103353.png]]

`useSelector` provides access to the value returned by the `getState` method. The `useSelector` takes a callback, to which it passes in the state and returns the value returned by the callback. We can assume that the `useSelector` acquires the state internally, passess the value to the callback and returns the returned value. We can store the value in a variable and use it in the module.

If we wanted to filter only certain notes, then useSelector is helpful for that purpose.

Some modules may need to use `useDispatch` , others may need to use `useSelector` . They both have to be imported from `react-redux`

[[multiple-reducers]]