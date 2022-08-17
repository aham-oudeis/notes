[Asymmetric_Encrypton](asymmetric_encryption.md) || [TLS Handshake](tls_handshake.md)

# Authentication

The core issue is that even if the messages are encrypted, the messages we send and receive may not be from the actual source. Someone might be posing as the source to recieve all the message. In that case, we would be sending sensitive information to an imposter with the cipher suite that the imposter provided.

To deal with this issue, we need some mechanism to test if the source is exactly who they say they are.

This is implemented with the help of __certificates__.

Sources acquire certificates from Certificate Authorities through some certificaton mechanism. 
    * This process generally consists of the source sharing some source-specific information to the Certificate Authority to verify that they are who they say they are.
    * The process is more or less like sharing the last four digit of our social security number when we call the bank. 

Certificate Authorities sign the certificate with their private key with some data and browsers can test whether these are reliable certificates by decrypting the data and comparing with the original data. If they match, then the certificate is signed by the alleged Certificate Authority

__Well, then, how does the browser know which certificate authority to trust?__

This is where the __chain of trust__ comes in. Certificates authorities are themselves certified by other authorities. At the end of the chain comes the Root Certificate Authorities. 

Since this chain of trust bottoms out on Root CAs, it is super important that their private keys are not compromised. Otherwise, the whole chain of trust would collapse.