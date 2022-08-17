[HTTP Headers](http_headers.md) || [HTTP Life Cyle](http_life_cycle.md) || [Status Code](status_code.md)

# HTTP requests

HTTP requests are sent by the client to the server. A HTTP request contains the following parts:
1. Request line or start line
    * Method: GET, POST
    * Path: to identify the local resource in the server
    * Version: version of the HTTP (Required since HTTP/1.0)
2. Host (Header): Domain name of the server (Required since HTTP/1.1)
3. Rest of the Header (Optional)
4. Body (optional, used in post requests)

Example: 
    `GET / HTTP/1.1` 

    `Host: www.google.com`

The Request line contains the method, path, and the version. On the next line is the host name. 

# HTTP responses
HTTP responses are sent by the server to the client and contains the following:
1. Status line (status code, status text)
2. Header (optional): the most relevant one would be 'location' (URL used when redirection needed, status code 302)
3. Body: content of the page being requested (html,css,js,pictures)

Example:
    `HTTP/1.1 200 OK`