[HTTP Request and Response](http_request_n_response.md) || [HTTP Headers](http_headers.md) || [Status Code](status_code.md) || [HTTP Security Risks](http_security_risks.md)

# How Accessing a Webpage works

1. When you enter a URL like http://www.google.com into your web browser's address bar, the browser starts the process for sending a HTTP GET request to the IP address that corresponds to the domain name `google.com`.
2. Since HTTP runs on TCP, the browser has to create a TCP Socket through which the HTTP requests are sent. This begins the search for IP address.
3.  If either your browser cache or computer's cache already has a record of the IP address for the domain name in its DNS cache, it will use this cached address. If the IP address isn't cached, a DNS request will be made to the Domain Name System to obtain the IP address for the domain.
4. Once the TCP socket is established after the [TCP handshake](tcp_handshake.md), the browser creates an HTTP request, which is packaged up and sent through the socket.
   * The HTTP request would consist of a request line (method name, path, protocol version), and a header with `Host` as key and the domain name as value. It may look something like this:

      `GET / HTTP/1.1` 

      `Host: www.google.com`

5. The packaged-up HTTP is encapsulated into a [TCP segment](transport_layer.md). This layer is where the source and the destinaation port number are added to the data.
6. The TCP segment gets further encapsulated into an [IP packet](internet_protocol.md). This is where the source and destination IP addresses are added to the TCP segment.
7. The IP packet is then encapsulated into an [Ethernet frame](ethernet.md). There is where the source and destination MAC addresses are added to the packet. The source MAC address is the MAC address of the sender and the destination MAC address is the MAC address of the receiver. Both MAC addresses change throughtout the journey of the packet.
8. This Ethernet frame goes through varous network bridging devices and finally reaches the server with the matching IP address. 
      (There is an enormous complexity involved in steps 5-7, but we can take for granted the how those layers work.)
9. Once the server device receives the frame, the PDUs are appropriately de-encapsulated at different layers and the HTTP request is sent to the server application.
10. Finally, the server processes the request and sends a response over the Internet back to your network interface which hands it to your browser.
      * The HTTP response sent by the server has a mandatory Status line containing the status code, optional header, and an optional body. A HTTP response status line might look like this:\
            `HTTP/1.1 200 OK`
      * The response headers contain information that is helpful to the browser for rendering the page. For instance, `Content_Type: html/txt`
11. Finally, the browser displays the response in the form of a web page.
