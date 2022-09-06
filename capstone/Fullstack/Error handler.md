## Error handler middleware

```javascript
try {
	//fetch data from database
} catch(e) {
	next(e)
}
```

The middleware to catch the error should be specified in the index file.

`app.use(errorHandler)`

The error handling middleware has to be the last loaded middleware.