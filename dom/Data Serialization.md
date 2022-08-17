## Request Serialization Formats

At the most basic level, this is simply about an effective method to send information over the wire and parse the relevant content effectively.

### Query String / URL Encoding

A query string consists of one or more `name=value` pairs separated by the `&` character. 

Presence of non-alphnumeric characters can complicate matters and thus requies encoding. For instance, spaces are encoded as `+` or `%20`

Javascript provides a built-in function, `encodeURIComponent` that lets you encode a name or value using this format.

Generally, this type of encoding goes with `GET` method and query string, but `POST` method can also make use of query string. For this, the request header must be changed:

```
POST /path HTTP/1.1
Host: someplace.where
Content-Length: 69
Content-Type: application/x-www-form-urlencoded; charset=utf-8
Accept: */*

title=Do%20androids%20Dream%20of%20Electric%20Sheep%3F&year=1968
```

### Multipart forms
Post request use multipart form formats for forms that include file uploads that use `FormData` object to collect data.

This format isn't strictly an encoding format since we don't encode anytyhing. Instead, we place each name-value pair in a separate section of the request body. 

A __Boundary delimiter__ defined by the Content-Type request header separates each part:

```
Content-Type: multipart/form-data; boundary=----WebKitFormBoundarywDbHM6i57QWyAWro
```
Here is how the entire request might look like:
```
POST /path HTTP/1.1
Host: example.test
Content-Length: 267
Content-Type: multipart/form-data; boundary=----WebKitFormBoundarywDbHM6i57QWyAWro
Accept: */*

------WebKitFormBoundarywDbHM6i57QWyAWro
Content-Disposition: form-data; name="title"

Do Androids Dream of Electric Sheep?
------WebKitFormBoundarywDbHM6i57QWyAWro
Content-Disposition: form-data; name="year"

1968
------WebKitFormBoundarywDbHM6i57QWyAWro--
```

The core idea here is that the relevant data is separated from the jumble of strings with some pre-specified delimiter. This has to be indicated in the `Content-Type` header. 

Note that the final boundary delimiter has an extra -- at the end; these characters mark the end of the multipart content.

### JSON serialization

It is used by programs written in different languages to exchange arrays, objects, strings, numbers, and boolean values over the network.

Example:

```
POST /path HTTP/1.1
Host: example.test
Content-Length: 62
Content-Type: application/json; charset=utf-8
Accept: */*

{"title":"Do Androids Dream of Electric Sheep?","year":"1968"}
```

[[Submitting via XHR]]