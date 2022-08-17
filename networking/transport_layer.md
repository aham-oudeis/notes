[Internet Layer](internet.md) || [Ethernet](ethernet.md) || [TCP vs UDP](tcp_vs_udp.md)

# Transport Layer

## Key Terms

__Multiplexing__
* The mechanism for transmitting multiple signals over a single channel is called multiplexing.
* In the context of the trasport layer, this is accomplished through the use of ip address with the port number

__Demultiplexing__
*  The mechanism for extracting distinct signals received over a single channel is called demultiplexing

__Port__
* Port is the identifier for a specific process or application

__Socket__
* Socket is an abstraction for endpoint in the inter-process communication
* In terms of implementation, the ip address of the device along with the port forms a socket

__Connection Oriented__
* A protocol for transmitting data by establishing a dedicated connection for that process is called a connection-oriented protocol

__Connectionless__
* A protocol for transmitting data without establishing a dedicated connection for that process is called a connectionless protocol

__Unreliable Chanel__
* A chanel for transmitting data that offers no guarantees of transmission, such that there is always a possibility of data loss.
* Since the layers below the Transport layer do not implement any functionality of retransmission, the internet is considered an unreliable channel
* To establish reliablility, one would have to implement functionalities required for reliability

__Pipelining__
* Sending of messages in clusters instead of sending messages only after the acknowledgement is received.

__Flow Control__
* The mechanism to prevent the sender from overwhelming the receiver with data
* this is implementedd by sending information in the `window` field in the header

__Congestion Avoidance__
* the mechanism to prevent the sender from sending data more than the network can process
* this is implemented by keeping track of the packet loss; the higher the loss of the packets, the higher the network congestion

__UDP__
* UDP is a connectionless protocol. Applications using UDP at the Transport layer can just start sending data without having to wait for a connection to be established with the application process of the receiver. In addition to this, the lack of acknowledgements and retransmissions means that the actual data delivery itself is faster; once a datagram is sent it doesn't have to be sent again. Latency is less of an issue since without acknowledgements data essentially just flows one way: from sender to receiver. The lack of in-order delivery also removes the issue of Head-of-line blocking (at least at the Transport layer).