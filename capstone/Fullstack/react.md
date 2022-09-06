
```
npx create-react-app part1
```

## React Concepts
### Component

Components are just functions that  returns a jsx objects that are parsed by the __babel engine__ under the hood.

The function defining the component may contain any kind of JS code.

### JSX
Although react components seem to be returning html markup, the layout of react components is mostly written using JSX. Under the hood, JSX returned by react components is compiled into javascript 

You can easily embed dynamic content by writing appropriate Javascript within curly braces.

### Props
Props make it possible to pass data to components.

The value we insert when using the components get passed as objects with the key being the name used for specifying the object that is passed in.

### Stateful Component
When the state modifying function is called, React re-renders the component, which means that the function body of the component gets re-executed.

A bit interesting part is that when the function body is executed, the `useState` function returns the updated value for the state. That is, it preserves the state of the component and returns that.

What I'm a bit puzzled about is how we can instantiate several state-modifying functions

![[Pasted image 20220716130650.png]]

React is setup in such a way that anytime it detects a change in the state, it re-renders the component whose state it is.