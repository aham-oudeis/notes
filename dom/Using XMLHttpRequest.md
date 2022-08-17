- XMLHttpRequest is an object that is part of the browser API, and not the JavaScript language.
- the new `fetch` API provides a much better interface, but knowing the details of `XMLHttpRequest` is a good way of understanding how things work under the hood.

```javascript
let request = new XMLHttpRequest();
request.open('GET', '/path');
request.send();
```

Javascript has access to the XMLHttpRequest object. It creates a new object and has methods like `open` , `send`. When we invoke the `open` method, the object  initializes the details for sending a request. The `open` method takes two parameters: http method and path. 

We can also set request headers on the object. 

Invoking the `send` method initiates the process of requesting the data from the server. This is the part that browser handles and when the response is ready, some value of the object changes. For example, the object's load value may change or the error value may change. This is why we append some event listener to the object and require that some function is executed when the object's state changes to some particular value.

After the request is completed, certain values of the object are filled in. For instance:

```javascript
request.responseText;
request.status;
request.statusText;

request.getResponseHeader('Content-Type');
```

The `send` method on the XMLHttpRequest object is asynchronous, meaning that code execution continues without waiting for it to complete. That means, all the logic inside the `send` method is evaluated asynchronously. There might be some logic regarding what to do when the state of the object changes from pending to load. 

Methods on the XMLHttpRequest Object:

![[Pasted image 20220624155546.png]]


Properties on the XMLHttpRequest object:

![[Pasted image 20220624155639.png]]

We can think of the Web API handling the object and keeping track of the state changes of the object. Or, at least that's a helpful way of understanding events. 

Two main events fire during an XMLHttpRequest cycle. One when the request is send, and onother when reponse loading ends.

1. `loadstart` : Request sent to server
2. `loadend` : Response loading done and all other events have fired. Last event to fire

Keeping track of these events is the business of Web API.

Before `loadend` triggers, another event will fire based on whether the request succeeded: 

![[Pasted image 20220624163856.png]]

Note: __browser considers any request that receives a complet response as successful, even if the response has a non 200 status code. It's the responsibility of the application to determine what counts as a success__

[[Data Serialization]]