# Partial Function

1. They rely on the fact that functions are closures.
2. They require a reduction in the number of arguments supplied.
3. They are most helpful when you need to pass a function to another function that won't call the passed function with enough arguments. 

Although this is not a practical example, the following example illustrates partial function application:

```javascript
function execParams(database, sql, params) {
  // say this function connects to the database
  // then runs the sql query on that database with the supplied params
}

//suppose there are two different databases you're working with: waterDatabase and fireDatabase
// we can create a partial function that returns a function with the database as its local variable
// and returns another function that calls the execParams function with all the required arguments

const sqlWithParams = function (database) {
  return function (sql, params) {
    return execParams(database, sql, params)
  }
}

let fireDatabase = 'some fire database';
let waterDatabase = 'some water database';

// in the following code, return distinct function objects each of which has a `database` variable
// initialized to the argument provided with the function invocation
// we can then rely on that anonymous function to take care of the providing the correct number of
// arguments when it invokes the execParams function 

const execParamsOnFire = sqlWithParams(fireDatabase);
const execParamsOnWater = sqlWithParams(waterDatabase);

execParamsOnFire('SELECT * FROM users;', []);
execParamsOnFire('SELECT * FROM missles;', []);
```


