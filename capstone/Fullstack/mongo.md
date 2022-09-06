## Mongo
Using `mongoose` library

Steps:
1. setup a cluster with mongoAtlas and acquire the mongoURI (this is the url where we send the request to interact with the database)
2. create a schema using 
```javascript
new mongoose.Schema({
	content: String,
	date: Date,
	important: Boolean,	
})	
```
3. create a model and pass in the schema
```javascript
const Note = mongoose.model('Note', noteSchema)

```
4. connect with mongoose `mongoose.connect(url)` which returns a promise and inside the callback function passed to `then`, do the processing.

### Models
Models are so-called constructor functions that create new Javascript objects based on the provided parameters. Since the objects are created with the model's constructor function, they have all the properties of the model, which include methods for saving the object to the database.

`findIdAndUpdate(id, updateObject, {new: true})`

The last `{new: true}` ensures the the object retured by the method is the new object and not the old object.

__Validators are not run by default on update__. Hence, `{runValidators: true, context: 'query'}` has to be added along with `{new: true}`.