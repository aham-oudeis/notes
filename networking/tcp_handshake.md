[Transport Layer](transport_layer.md)  || [TLS Handshake](tls_handshake.md)

# TCP Three way handshake

* The steps that TCP protocol requires for establishing a connection
* It also serves to synchronize the sequence number used in message exchange

1. The sender sends a `SYN` message (with `SYN` flag marked 1)
2. When the receiver receives the `SYN` message, it send `SYN ACK` message back (with `SYN` and `ACK` flag set to 1)
3. When the sender receives thee `SYN ACK` message, it sends an acknowledgement (with `ACK` flag set to 1)

Then the sender is ready to start sending messages