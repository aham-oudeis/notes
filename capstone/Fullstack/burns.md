1. calling `useEffect` multiple times
> when you provide empty array dependency, your useEffect execute once
>   when you some value as dependency (eg: `[name]` ), your useEffect execute when name state/prop changes
>   useEffect executes on every re-render if you don't pass the dependency array.

