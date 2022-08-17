Javscript creates a **global execution context** when it starts running along with a **global object** and this global object is the value of `this` within the global execution context. The value of `this` in the global execution context is also the global object in the strict mode.

```javascript
'use strict';

console.log(this); // Window {...}
```

The global values such as `Infinity`, `NaN` and other global functions are properties of the global object.

In the global execution context, variables declares with `var` keyword or without any declarations and function declarations are assigned as the properties on the global object.

```javascript
a = 'hi';

this.a; // 'hi'
window.a; // 'hi'
```

But this kind of variable assignment without declaration raises an error in strict mode.

Aside: In non-browser environments, such as Node, the global object is not window, but global. 

[[function_execution_context]]