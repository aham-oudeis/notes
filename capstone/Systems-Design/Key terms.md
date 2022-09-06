## Key terms 
### Proxy server
 A server that takes in the incoming requests and forwards it to the other servers. It acts as a wall between the client and the actual servers. A key part here is that in proxy server, the actual server does not know which client is connecting to the server. To the actual server, the incoming requests are all coming from the proxy server.

__Benefits__
1. anonymity
2. caching 
3. blocking unwanted sites (isp can regulate that)
4. geofencing (certain clients can only access certain content)

### Reverse Proxy
The other way round: the client has no idea which server it is connecting to. To the client, all the requests are processed by the reverse proxy server. Load balancer is an example of this.

__Benefits__
1. load balancing
2. caching
3. isolating internal traffic
4. logging
5. canary deployment


## SSH keys
They are secret identifiers for your computer. If the keys match, then that estblishes that the connection is coming from a trusted computer.

if you already have ssh keys, no need to do it further. You can reuse the previously generated ssh keys. To generate the key, following code generates the new ssh key.

```
ssh-keygen
```

The ssh key is generated in id_rsa.pub

Then you can copy that key and paste in the github.e