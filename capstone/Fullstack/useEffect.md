## useEffect
the `useEffect` function takes function that is to be called for side-effects. However, the function returned by this callback function is called for cleanup.

This clean-up function helps prevent memory leaks.

This clean-up function is called in two cases: 
1. before the next scheduled effect, using depending on the dependency array
2. when the component is unmounted

When we want the `useEffect` to fire only once, then we can supply an empty array. That implies, that there is no value that changes that requires calling the `useEffect`. However, if the second argument is missing, then the `useEffect` is called with every render of the component.