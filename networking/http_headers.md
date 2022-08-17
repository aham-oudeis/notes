[HTTP Life Cycle](http_life_cycle.md)    ||    [HTTP Request and Response](http_request_n_response.md)

# HTTP Header 

HTTP headers allow the client and the server to send additional information during the request/response HTTP cycle. Headers are colon-separated name-value pairs that are sent in plain text.

## Request Header
Host: The domain name of the server.\
Accept_Language: List of acceptable languages\
Connection: The type of connection the client would prefer\
Cookie: Cookie data to identify sessions\

we need an empty line (an extra carriage return and line feed) after the header to signal the end of header and start an optional body

## HTTP Response Header
Content_Encoding: The type of encoding used on the data\
Server: Name of the server\
Location: Notify client of new resource location\
Content_Type: The type of the data the response contains.\
Cookie: Cookie data to identify sessions
