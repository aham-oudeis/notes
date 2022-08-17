[Transport Layer](transport_layer.md)  || [Transport Layer Security](transport_layer_security.md) || [Asymmetric_Encrypton](asymmetric_encryption.md)


# TLS Handshake

Since HTTP is not encrypted but sent in plain text, it is unsecure. In order to add security, HTTP can be used with Transport Layer Security (TLS) protocol. This protocol can be conceived as operating between the Application and the Transport layer.

1. Immediately after the client sends the `ACK` message in the TCP three-way Handshake, the client sends a `ClientHello` message, which includes the maximum version of the TLS protocol it can support along with a list of cipher suites (all the encryption and hashing algorithm) it can use.
2. Once the server receives the message from the client, it sends a `ServerHello` message, where the server sets the protocol to be used and the ciphers. The server also sends its certificate with its public key for encryption and a `ServerHelloDone` marker to indicate that this step of the handshake is completed.
3. Once the client receives the `ClientHelloDone` marker, the client begins the symmetric key exchange process. For instance, the client can encrypt the symmetric key with the server's public key. (It's more complicated than this, but this general idea illustrates the point.) The server can decrypt the encrypted symmetric key using its private key. The client sends `ChangeCipherSpec` flag, to indicate that communication should now use the symmetric key.
4. The server sends back `ChangeCipherFlag` and `Finished` flag to indicate that the message exchange can be begin with the symmetric key.