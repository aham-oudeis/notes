## Summary

__Multiplexing__ and __demultiplexing__ provide for the transmission of multiple signals over a single channel

__Multiplexing__ is enabled through the use of network ports

__Network sockets__ can be thought of as a combination of IP address and port number

At the implementation level, sockets can also be __socket objects__

The underlying network is inherently unreliable. If we want reliable data transport we need to implement a system of rules to enable it.

TCP is a __connection-oriented protocol__. It establishes a connection using the Three-way-handshake

TCP provides reliability through
  * message acknowledgement and retransmission
  * in-order delivery.

TCP also provides __Flow Control__ and __Congestion Avoidance__

The main downsides of TCP are the latency overhead of establishing a connection, and the potential __Head-of-line (HOL)__ blocking as a result of in-order delivery.

UDP is a very simple protocol compared to TCP. It provides multiplexing, but no reliability, no in-order delivery, and no congestion or flow control.

UDP is connectionless, and so doesn't need to establish a connection before it starts sending data

Although it is unreliable, the advantage of UDP is speed and flexibility.

