## Dot env
`npm install dotenv`

This allows us to pass the environment variables to the js files.

1. create a `.env` file at the root of the project directory.
```env
MONGODB_URI=....url...
PORT=3001
```

this `.env` file should be gitignored right away.

2. require the `dotenv` and then call the `config` method on it. `require('dotenv').config()`
3. then `process.env` returns an object with the key and values. Hence, to acess the port `process.env.PORT`