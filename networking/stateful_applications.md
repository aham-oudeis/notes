[HTTP Terms](http.md)  || [HTTP Life Cyle](http_life_cycle.md) || [HTTP Security Risks](http_security_risk.md)

## Stateful Applications

Since HTTP protocol is stateless, the web browser has to do a lot of work in the background to simulate a stateful application.

1. Through the use of session identifier:
   * The server sends some form off a unique token to the client and whenever the client makes a request to the server, it appends this token as a part of the request. This allows server to identify clients.
   * This sort of faux statefulness has several consequences. First, every request must be inspected to see if it contains a session identifier. Second, if this request does, in fact, contain a session id, the server must check to ensure that this session id is still valid. The server needs to maintain some rules with regards to how to handle session expiration and also decide how to store its session data. Third, the server needs to retrieve the session data based on the session id. And finally, the server needs to recreate the application state (e.g., the HTML for a web request) from the session data and send it back to the client as the response.
   * A cookie is a piece of data that's sent from the server and stored in the client during a request/response cycle. They contain the session information.

2. Through the use of AJAX (Asynchronous Javascript and XML)
    * It enables several components of a webpage to be updated without a full page refresh. 
