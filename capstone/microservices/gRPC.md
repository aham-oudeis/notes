# Limitations of REST APIs
1. no formal API contract
			- writing client libraries requires humans
2. streaming is difficult (nigh-impossible in some languages)
3. bi-directional streaming isn't possible at all
4. operations are difficult to model (e.g. 'restart the machine')
5. inefficient (bc textual representations aren't optimal for networks)
6. internal services aren't restful anyways, they're just HTTP endpoints
7. hard to get many resources in a single request (GraphQL)

Problem: streaming using REST API is difficult and the sending representations over the network is inefficient.
# gRPC

