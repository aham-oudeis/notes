# Summary of Transport Layer Security

* HTTP Requests and Responses are transferred in plain text; as such they are essentially insecure.

* We can use the __Transport Layer Security (TLS)__ Protocol to add security to HTTP communications.

* TLS encryption allows us to encode messages so that they can only be read by those with an authorized means of decoding the message

* TLS encryption uses a combination of __Symmetric Key Encryption__ and __Asymmetric Key Encryption__. Encryption of the initial key exchange is performed asymmetrically, and subsequent communications are symmetrically encrypted.

* The __TLS Handshake__ is the process by which a client and a server exchange encryption keys.

* The __TLS Handshake__ must be performed before secure data exchange can begin; it involves several round-trips of latency and therefore has an impact on performance.

* A __cipher suite__ is the agreed set of algorithms used by the client and server during the secure message exchange.

* TLS __authentication__ is a means of verifying the identity of a participant in a message exchange.

* TLS Authentication is implemented through the use of Digital Certificates.

* Certificates are signed by a Certificate Authority, and work on the basis of a __Chain of Trust__ which leads to one of a small group of highly trusted Root CAs.

* __Certificates__ are exchanged during the TLS Handshake process.

* TLS Integrity provides a means of checking whether a message has been altered or interfered with in transit.

* TLS Integrity is implemented through the use of a Message Authentication Code (MAC).

