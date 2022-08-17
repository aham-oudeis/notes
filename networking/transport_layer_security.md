[HTTP Security Risks](http_security_risk.md)

# Transport Layer Security

[__TLS Handshake__](tls_handshake.md)
* A system for exchanging symmetric key.

__Cipher Suite__
The client and server use variety of cryptographic algorithms for different aspects of a secure message exchange. The list of algorithms is called a cipher suite.

__Encryption__
* Transforming a message into a seemingly nonsensical message in a systematic way such that the message can be recovered only by the one with the key to deciphering the message.

* Decryption is the process of recovering the original message from the encrypted message

__Symmetric Encryption__
* When encryption and decryption is performed using the same key, then it is a symmetric encryption.
* A simplest form of symmetric encryption is a substtution cipher, where every character is substituted by another character based on some rule.

[__Asymmetric Encryption__](asymmetric_encryption.md)
* Encryption that relies on public and private key pair.

[__Authentication__](authentication.md)
* Process that allows us to verify that the source is exactly who they claim to be.

__Integrity__
* Integrity of the message is ensured by using a specific hashing algorithm and a pre-agreed hash value. 
* The sender creates a digest of the data payload using the hashing algorithm and sends it to the receiver.
* The receiver decrypts the message and creates a digest based on the payload. If it matches the digest that the sender sent along, then it confirms the integrity of the message. 

__MAC__
Message Authentication Code is a part of the TLS record that is used for checking the integrity of the messages.