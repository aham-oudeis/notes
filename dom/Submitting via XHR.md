Three steps to submitting a form using JS:
1. serialize the form data
2. send the request using `XMLHttpRequest`
3. handle the reponse

Sample:

```javascript
let request = new XMLHttpRequest();
request.open('POST', 'https://example.something/path');
let data = 'this is just a test string to send as data';

request.send(data);
```
Basic idea here is that the data is send as an argument to the `send` method.

If this code were to be executed, the header for the request might look something like this:

```
POST /path HTTP/1.1
Host: example.test
Content-Length: 14
Content-Type: text/plain;charset=UTF-8
Accept: */*

this is a test
```
The point to note here is tha the `Accept` header gets set to `*/*` if it is not specified. The way to specify the value for that header is to use the `setRequestHeader` method.

# Submitting a Form

Suppose we are working with a webpage that contains the following form:
```html
<form id='form'>
	<p><label>Title: <input type6'text' name='title'></label></p>
	<p><label>Author<input type6'text' name='author'></label></p>
	<p><button type='submit'>Submit</button></p>
</form>
```

To access the values of the form, we can get the form element and get its `elements` property.

Here is how we might write the code for submitting this form:
```javascript
let form = document.getElementById('form');

//create an event listener for when the submit event is triggered on the form

form.addEventListener('submit', event => {
	//first stop the browser from submitting the form based on the event, it's default behavior
	event.preventDefault();

	//access the inputs using the form.elements and serialize it into a string
	let keysAndValues = [];

	for (let index = 0; index < form.elements.length; index++) {
		let element = form.elements[index];
		let key;
		let value;

		//skip the submit button that is also one of the elements of the form element
		if (element.type !== 'submit') {
			key = encodeURIComponent(element.name);
			value = encodeURIComponent(element.value);

			keysAndValues.push(`${key}=${value}`)
		}
	}

	//now we have all the key value pairs for the form

	let data = keysAndValues.join('&');

	//now that the data is ready, we can send the form
	let request = new XMLHttpRequest();
	request.open('POST', 'https://ls-230-book-catalog.herokuapp.com/books');

	request.setRequestHeader('Content-type', "application/x-www-form-urlencoded");

	request.addEventListener('load', () => {
		if (request.status === 201) {
			console.log('This book was added to the catalog: ${request.responseText}');
		}
	})
})
```

### Using FormData

While we submitted the form using URL encoding, we could also send it using formData. Modern browsers provide a built-in API to assist this process. 

```javascript
let form = document.getElementById('form');

form.addEventListener('submit', event => {
	event.preventDefault();

	// we pass in the form element and the browser takes care of getting the relevant data from the form element and supllying it as the data when we invoke the send method on the XHR
	let data = new FormData(form);

	let request = new XMLHttpRequest();
	request.open('POST', 'https://ls-230-book-catalog.herokuapp.com/books');

	request.addEventListener('load', () => {
		if (request.status === 201) {
			console.log('This book was added to the catalog: ${request.reponseText}');
		}

		request.send(data);
	});

})
```

FormData uses the multipart serialization. This is a kind of serialization that works for all the file formats. Hence, it makes sense that it is the default.

Problems:
1. Write some javascript code that loads JSON data from `https:/api.github.com/repos/rails/rails`, parses the JSON into a Javascript object, and the nlogs the HTTP status code and the number of open issues to the console.

```javascript
document.addEventListener('DOMContentLoaded', () => {
	let request = new XMLHttpRequest();
	request.open('GET', 'https://api.github.com/repos/rails/rails');
	request.responseType = 'json';

	request.addEventListener('load', (e) => {
		if (request.status >= 200 || request.status < 200) {
			console.log(request.open_issues);
		}
	});

	request.send();
})
```