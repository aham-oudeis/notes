## Redux toolkit
`npm install @reduxjs/toolkit`

`import { configureStore } from @reduxjs/toolkit`  

`import { createSlice } from @reduxjs/toolkit`

With `configureStore`, we can combine the work of `combineReducers` and `createStore`.

![[Pasted image 20220726112346.png]]

>  _configureStore_ function has many additional benefits such as the effortless integration of development tools and many commonly used libraries without the need for additional configuration.


### `createSlice`
Input: A configuration object, with `name`, `initialState`, and `reducers` property. 

- The `name` property specifies the action type path. 
- The `initialState` property specifies the initial state for the reducers.
- The `reducers` property takes in an object with reducer functions.

Returns: Object with `actions` property that returns the reducer with the same name. It takes a value and converts into an object with the type based on the name of the function and payload is simply the content passed in. For instance:

![[Pasted image 20220726114914.png]]

Here, the `createSlice` returns an object with a property `actions` that contains an object with functions with the name `createNote` and `toggleImportanceOf`. These are action creators. 
![[Pasted image 20220726115627.png]]
They take in some value and return an object with the type `notes/createNote` and payload is the content passed in.

![[Pasted image 20220726115350.png]]

Does it pass the object only to the corresponding functions?

> The _createSlice_ function's _name_ parameter defines the prefix which is used in the action's type values. For example the _createNote_ action defined later will have the type value of _notes/createNote_. It is a good practice to give the parameter a value which is unique among the reducers. This way there won't be unexpected collisions between the application's action type values. The _initialState_ parameter defines the reducer's initial state. The _reducers_ parameter takes the reducer itself as an object, of which functions handle state changes caused by certain action. Note that the _action.payload_ in the function contains the argument provided by calling the action creator:

Since `createSlice` uses `Imer` library, it is okay to use code that seems to mutate the state. what happens internally is that the state is mutated and a new object with the mutated state is returned. Hence, the state despite seeming to be mutated is actually a new state. The old state object is mutated.

[[redux-thunk]]