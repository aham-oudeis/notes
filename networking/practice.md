1. When at least two or more devices are connected in such a way that they can exchange data, it forms a network. Internet is a vast network of networks connected and sustained by a wide array of components, such as routers, switches, cables, radiowaves, etc. Hence, internet as a network of networks means that the whole internet is simply just a vast network of devices connected through various networking devices. The physical devices and mediums that undergrid the internet constitute the __Network Infrastructure__. 

2. The role of an IP address in to uniquely idenfity the device on the internet. Since the IP addresses are hierarchical and logical, the process of locating a specific id address is more manageable than if we were to rely on the device's MAC address. 
   
The overall network, the internet, is divided into logical subnetworks creating a network heirarchy. The IP address of a device must fall within a range of addresses available to the local network that the device is connected to. This hierarchy enables the routers to figure out which next device to send the data to, without having a record of every device.

Bascially, all routers on the network have a local routing table. Routers examine the destination IP address of the IP packet and matches it against the list of network addresses in its routing table. The matching network determines where in the network hierarchy the subnet exists. This kind of mechanism is used to determine the best route for the IP packet. 

In order for this process to work effectively, the source and the destination IP address is added to the header of the internet packet (the protocol data unit of the Network layer).

4. First, a protocol is a set of rules governing the exchange of data so as to enable various facets of systematic communication. A protocol might deal with the structure of the messages or the order of the messages or the delivery of the messages. Since a large number of protocols is employed to facilitate the communication on the internet, we need a systematic and modular way of making use of those protocols, such that different layers can operate independently of each other. That is, one layer can assume that the previous layer does its own thing properly. The lower layer can be seen as providing a service to the higher level. This layered approach makes the communicaton modular, such that  protocols can be changed without having to modify other layers. For instance, it is this layered approach that allows us to switch from IPv4 to IPv6 without having to modify either the transport layer above or the link layer below.

5. Latency is a measure of time it takes for data to get from one point in the network to another point. It is a measure of delay between sending and receiving data. It includes propagation delay, transmission delay, processing delays, and queuing delay. 

Bandwidth is the amount of data that can be transmitted in a given unit of time (usually per second).

Higher the latency, lower the performance. Higher the bandwidth, greater is the performance. That is, while higher latency means slower communcaton, higher bandwidth means faster communication. 


9. While TCP provides services like in-order delivery, acknowledgement, retransmission, UDP does not provide such services; as a result, TCP offers reliabillity, UDP does not.TCP adds latency because of acknowledgement and in-order delivery functionality (in addition to the three way handshake), UDP involves lower latency because it can send data without implementing any of those functionalities; as a result, data transfer is faster with UDP than TCP. For this reason, where data loss is unacceptable, we use TCP. For instance, in sending emails, we use TCP, because loss of some data in the email can drastically change the content of the email. On the other hand, where some data loss is acceptable, such as voice calling or video streaming, we used UDP. 


1. Scheme: `https` Scheme of a URL specifies how the application communicates with the server(mandatory).
2. Host: `animal-facts.org` Host identifies the device/server that the application is communicating with.
3. Path: `/cats` Path specifies the local resource in the server.
4. Query String with parameters: `breed=persian&limit=20` Query string supplies extra information to locate the specific item


18. `session id` is a way of simulating state despite the fact that the `http` protocol is stateless. The server sends some form of a unique token to the client and whenever the client makes a request to the server, it appends this token as a part of the request. This allows the server to identify clients. Since the database keeps track of the data based on the `session id`, it can recreate the state and send it to the client. This `session id` is stored as a cookie in the browser. A cookie is a piece of data that's sent from the server and stored in the client during a request/response cycle.

19. Since HTTP is a stateless protocol, application employ varieties of techniques to simulate stateful application. These techniques introduce new vulnerabilities, because the exchange of information through HTTP protocol is done in plain text. Session hijacking is a type of attack that happens when an attacker gets acceess to the session id (perhaps through packet sniffing) and thus is able to access the sensitive information without having to login in. 
   Some of the countermeasures against session hijacking are as follows:
   * Resetting sessions: Resetting sessions makes the old session id useless in accessing information.
   * Expiration of sessions. The session ids can have an expiration date so that the stale ids are useless. 
   * Using HTTPs: All the HTTP messages are encrpted so that the intercepted messages in their encrypted form are useless. 


22. TLS provides the authentication service. Basically, authentication is a way of verifying the participant in a message exchange. This is implemented with the help of __certificates__.

Sources acquire certificates from Certificate Authorities through some certificaton mechanism. 
    * This process generally consists of the source sharing some source-specific information to the Certificate Authority to verify that they are who they say they are.
    * The process is more or less like sharing the last four digit of our social security number when we call the bank. 

Certificate Authorities sign the certificate with their private key with some data and browsers can test whether these are reliable certificates by decrypting the data and comparing with the original data. If they match, then the certificate is signed by the alleged Certificate Authority

Well, then, how does the browser know which certificate authority to trust?

This is where the __chain of trust__ comes in. Intermediate Certificates authorities are themselves certified by other authorities. At the end of the chain comes the Root Certificate Authorities. 

Since this chain of trust bottoms out on Root CAs, it is super important that their private keys are not compromised. Otherwise, the whole chain of trust would collapse.