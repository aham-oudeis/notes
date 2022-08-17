[Transport Layer](transport_layer.md)  || [TLS Handshake](tls_handshake.md)

# TCP vs UDP

Similarities:
1. Both are transport layer protocols; hence, both provide the basic transport layer functionality of multiplexing and demultiplexing, and checksum.

Dissimlarities:
1. While TCP is connection oriented, UDP is a connectionless protocol.
2. While TCP provides services like in-order delivery, acknowledgement, retransmission, UDP does not provide such services; as a result, TCP offers reliabillity, UDP does not.
3. TCP adds latency because of acknowledgement and in-order delivery functionality, UDP involves lower latency; as a result, data transfer is faster with UDP than TCP.
4. While TCP provides flow control and congestion avoidance, UDP does not. 
