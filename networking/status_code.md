[HTTP Terms](http.md)  || [HTTP Headers](http_headers.md) || [HTTP Request and Response](http_request_n_response.md) 

# Status Code 

The `status code` is a three-digit number that the server sends back after receiving a request signifying the status of the request. The `status text` displayed next to the `status code` provides the description of the code.

`200 OK`: The requested resource was handled successfully.

`302 Found`: The requested resource has moved temporarily. Usually results in a redirect.
  * When you try to access a page that requires you to login first, this is the status line we get that results in a redirect to the login page and then back the original requested page.

`404 Not Found`: The server returns this status code when the requested resource cannot be found.
  * When we specify a path or a file that the server cannot locate, we get this status code

`500 Internal Server Error`: This is a generic error status code and the core problem can range from misconfigured server setting to a misplaced comma in the application codee. This indicates a server-side problem.