### API
Application programming interface provides a way for computer systems to interact with each other. 

Every programming language has a built-in API that is used to write programs. 

Mobile devices provide APIs to provide access to location or other sensor data, such as the device's GPS location or the orientation of the device

Basically, API expose functionality for use by another program.

### API provider and consumer
- Provider is the system that provides an APi for other parties to use.  Github is the provider of the Github API, and google is the provider of Google api.
- Consumer is the system that uses the API to accomplish some work. When you check the weather on your phone, it is running  a program that is consuming a weather API to retrieve forecast data.

Here, our interest is in being consumers of the provided API. The skills to learn is about how to effectively navigate API of various sources and be able to read up on their documentation to understand how to effectively work with the provided API.

Basically, API is all about facilitating communication between devices or between different parts of a device. One common kind of communication is simply sharing data between systems.

Suppose you create an app for creating birthday cards. Since cards are used for special purposes and send to special people, your app is going to have to collect all that information about people from the users. Or, you could effectively outsource that need to some other website that does that work better. Say, facebook has all the information about when greeting cards become important and who to send it to. 

### Public and Private 
Whereas public APIs are intended for consumption outside the organization that provides them, private APIs are only for intenal use.

Even when it is possible to call a private api, it is wrong to do so.

### Restrictions on API consumption
- there can be limit on the kinds of devices that can store the data retrieved from the api
- by consuming information about some individual from social media apps, you are taking on the responsibility of keeping it safe and secure
- apis can have rate limits: many apis limit how many requests can be sent from a single user or application within a given time.

__While the status codes gives you information about the success or failure of the reponse, whether the server returns the expected status code is a matter of programmers putting it there. And there could be some oversight that one needs to prepare for__

## Media Type
Media type / content type / MIME type

- HTML is one of many different media types supported by web browsers and is represented in an HTTP response as the Content-Type header as `text/html`:
			`Content-Type: text/html; charset=UTF-8`
- The charset tells the browser which set of characters the reponse is using and the charset for most requests will be UTF-8 or ISO-8859-1
- depending what you are accessing, the value of `Content-Type` header will change

## Data Serialization
Since APIs are generally used to allow systerms to communicate by passing structured data back and forth, the content of most requests will use a format and media type that works well for representing hierarchical data. These formats are known as __data serialization format__.

Basically, data serialization is about the structure of the data so that each party can easily distinguish data from non-data.

Data serialization format describes a way for programs to convert data into a form which is more easily or efficiently stored and transfered. The stored or transferred data can then be converted back into the original data at any time by the original program or any other program that can understand its format.

#### XML
XML (or extensible markup language) shares common heritage with HTML: they are both based on an earlier and similar type of markup, SGML. XML is generally stricter than HTML and doesn't handle missing tags or improper nesting. 

#### JSON
JSON (or Javascript Object Notation) is perhaps the most popular data serialization format used by web APIs today. The syntax JSON uses is based on the way object literal are written in JavaScript, the ubiquitous scripting language of the web. 
	- It is a simple and less ambiguous format

### what is REST?

It is a set of conventions to streamline the process of communication that involve getting data, creating data, updating data, and deleting data. Basically, a set of conventions for building apis.

How to organize the resources that you make available through your api?
	- what resource is being acted upon?
	- how is one interacting with the resource?

What's the need for these conventions? 

It's like driving: if there are set of conventions around what kinds of things to do under various circumstances, then that eliminates the problem of having to communicating while riding the lethal machine.

### CRUD 
CRUD is an acronym that is used to describe the four actions that can be taken upon resources:
	- Create
	- Read
	- Update
	- Delete

RESTful APIs will model most functionality by matching one of these operations to the appropriate resource. 

What is most powerful about REST is that by being a set of conventions, it is universal and appleis just as well to any kidn of resource. By following REST conventions, API designers have fewer decisions to make about how to build an API and API consumers have fewer questions to answer before using one. 
	- Fetching an object? It's probably a GET request to `/things/:id`.
	- The resource-centric nature of REST and limited set of CRUD actions limit the complexity for API providers and consumers alike.

![[Pasted image 20220624131956.png]]

Singular resource / singleton resource: Paths and URLs for singular resources identify a single resource.

### Handling Errors

__While working with APIs, it is common to use the status code to detemine at a high level if a request was succesfful or not.__