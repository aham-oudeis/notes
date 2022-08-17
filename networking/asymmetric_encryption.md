[Transport Layer Security](transport_layer_security.md)  || [Authentication](authentication.md)

# Asymmetric Encryption

* When encryption and decryption are performed using different keys, then it is an asymmetric encryption.

* The main problem that aymmetric encryption solves is of having to share a symmetric key through an unreliable channel. 

Say Alice wants to send her pin code to Bob over an unsecure channel. To do that she can ask Bob for his public key. 

Say, Alice encrypts the message using some algorithm; let M(p) be the message encrypted with the public key (p). Suppose there is a function 'f' such that for a public key (p) and a private/hidden key (h), the following is true:
    f(M(p), h) = f(M(h), p) = original message

That is, a message encrypted with the public key can only be decrypted with the private key and vice versa. With the help of this function, Alice can send the pincode to Bob and ensure that only Bob will be able to recover the pincode.

This relies on what is known as __one-way-functions__, functions that are easy to evaluate using a given paramenter but rather hard to reverse engineer the parameter from the given value. 

Here is a small example:

Say, Alice selects 13
```ruby
p (7**13) % 17  # => 6
```
Then, Alice sends 6 to Bob. Bob does the same after selecting 101

```ruby
p (7**101) % 17 # => 11
```

Bob sends 11 back to Alice. On Alice's end, she makes use of 11 in the same functon. She raises the received number to the power of her selected number. Bob does the same.

```ruby
p (11**13) % 17 # => 7 


p (6**101) % 17 # => 7
```

Now both Alice and Bob arrive at the same number 7, which they can use as a symmetric key. Alice can use this symmetric key to send her pincode to Bob and Bob can use 7 to decipher the encrypted pincode.

Based on the publicly available information, it is kinda hard to arrive at 7. That is, based on the function (7**(numbeer)) % 17 and the numbers 6 and 11, it is rather hard to generate 7. When the primes are really huge, the decryption becomes astronomically difficult. 
