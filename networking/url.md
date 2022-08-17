[HTTP Terms](http.md)  || [HTTP Request and Response](http_request_n_response.md) || [HTTP Life Cyle](http_life_cycle.md)

# URL

## Components of a URL
1. Scheme
2. Host
3. Port
3. Path
4. Query String with parameters

https://www.launchschool.com:80/courses?name=Networking%20Foundations

* Scheme: Component of a URL that specifies how the application communicates with the server(mandatory). It comes before the colon and two forward slashes. `https`
* Host: The device/server that the application is communicating with (mandatory). It tells the client where the resource is hosted. `www.launchschool.com`
* Port: The identifier for the specific application in the server (optional) `80`
* Path: The location inside of the server (optional). It specifies the local resource in the server. `/courses`
* Query String: Extra information we pass to locate the specific item (optional). `name=Networking%20Foundations`

## URL encoding

URL uses certain characters to distinguish between different parts. For instance, colon (:), slash (/), question mark (?), ampersand (&). These charaacters are reserved. 

There are other unsafe characters, such as space ( ) or percentage (%) or quotation marks (""). Since these unsafe characters can be interpreted in a wrong manner, they cannot be used in an URL. 

If a character is not present in the 128-character ASCII-character set, then they have to be encoded.

These non-conforming characters are encoded using a hexadecimal number that represents the character.

## Converting URL to HTTP request

HTTP request involves a request line as follows:
`GET /index.html?name=samsung HTTP/1.1`

That means, the scheme is appended at the end of the status line. The Path and the query string of the url comes after the method. This part of the request line is called request-URI. 