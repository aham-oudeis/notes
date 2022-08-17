[HTTP Headers](http_headers.md) || [HTTP Life Cyle](http_life_cycle.md) || [Status Code](status_code.md) || [HTTP Security](http_security_risk.md)

# Basic Terms in HTTP

__HTTP__

HTTP, or Hypertext Transfer Protocol, is a system of rules, a protocol, that serves as a link between applications and the transfer of hypertext documents. Stated differently, it's an agreement regarding message format so that machines communicate with each other. HTTP follows a simple model where a client makes a request to a server and waits for a response. Hence, it's referred to as a request response protocol.

__Statelessness__

HTTP protocol is stateless because the request-response pairs are independent of each other. That is, the server does not hang on to the information from previous request-response cycle.

See [Stateful_Applications](stateful_applications.md) on how to work around the statelessness of HTTP protocol.

__DNS__

Domain Name System or DNS is a distributed database which translates domain names like www.google.com to an IP address, so that the IP address can then be used to make a request to the server. DNS databases are stored on computers called DNS servers.

__GET Request and POST Request__

* While GET request is used for retrieving some web resource, POST request is used for updating the dabatabse on the server side.
* Most links are GET requests; POST requests are made from within the webpage.
* Query strings are used with GET requests for search functions, but for sending sensitive data, POST requests are used.
* POST requests make use of the HTTP request body to send data to the server
