## Thunk
`npm install redux-thunk`

Problem: 
When the code for reacting with database is used in the app component, we need a system for asynchronously running the code. Either we separate the code for interacting with the database in a different module or we use asynchronous code inside the action creators. But react/redux code does not work well with asynchronous code. 

Hence, we need some middleware to handle this issue.

Thunk middleware takes the action and interacts with the database accordingly.

![[Pasted image 20220726120757.png]]

The `dispatch` method returned by `useDispatch` takes in the function and takes the appropriate action. Since the argument is a function and not an action object, the execution takes a different path. That is how things are configured. The function passed in to the dispatch is designed to take the `dispatch` method. Basically, the `dispatch` method internally stores the reference to itself, sees that the argument is a function, and passes in the reference to itself and calls the function.

Hence, the action creator has to be designed as follows:
![[Pasted image 20220726121712.png]]

This `createNote` function is called with some value and it returns a function with a closure where the `content` variable references the value passed in. 

Research:
`createAsyncThunk`
`RTK Query`
