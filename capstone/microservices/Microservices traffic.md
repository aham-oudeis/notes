Core argument for Apex: although existing api gateways are good for outward facing traffic, they are not ideal for the kind of scenario where a business is transitioning from a monolithic architecture to microservices architecture, because they are optimized for traffic at the edge of the data center, they are inefficient for the large volume of traffic in distributed microservices environments. It cannot be containerized and the constant communication with the database and a configuration server adds latency. 

## Connecting Microservices: Broad requirements
__Authentication__: a client needs to be authenticated in all the services
__Security__ (encryption): with many microservices, the attack surface is greater
__Logging__ (broadly observability): logs of all the services are distributed in various places
__Service discovery__ (needs sth like dns): services running on ephimeral containers need a way to track which service is running on which container; where to forward a request
__Traffic control__: Related to load-balancing and routing (not sure yet)

cross-cutting concerns: authentication, security, service-discovery

## Two Main Solutions:
	[[#API gateway]]                               
	
	[[Service Mesh]]:

[[Transitioning to microservices]]

## API Gateway
API gateway provides a curtain-like shield such that the client does not have to know how the internal services are undergoing change.

- outward facing reverse proxy
- provides security benefits
- one of its primary functions is to provide a stable API to clients and route client requests to the appropriate service.
- provides rate-limiting and fault-handling logic

### Limitations
- single point of failure and bottleneck
- too many integrated features may slow down performance for internal traffic bc of bloat

[kong, tyk, mulesoft, boomi, amazon api gateway, azure api management, cilium, apache APISIX]

![[Pasted image 20220927201231.png]]

> Two major components for a system like API Gateway are _configuration management_ and _runtime_. The runtime component is responsible for authenticating, authorizing, transforming, and routing requests to appropriate downstream services, and passing responses back to Mobile. The configuration management component is responsible for managing the workflow for developers to easily configure their endpoints on the gateway.

## Service Mesh
A complex solution that requires having a sidecar proxy for each node
![[Pasted image 20220926213109.png]]

[istio, hashicorp consul, aws app mesh, apache serviceComb]

## Apex
Solution: We need a different kind of api-gateway that facilitates the communication between services.

> Apex is an api proxy for microservices: to log and control service-to-service traffic

Essential tradeoffs for small companies transitioning to microservices:
- It's an idea between API gateway and service mesh, but more like an api gateway with less features
- trades simplicity and convenience for high availability and scalability
- suited for small companies that are just transitioning from a monolith to a microservices architecture

![[Pasted image 20220926213509.png]]

### Features of Apex
- Logging and tracing service-to-service traffic by inserting `correlation-id` to http headers before forwarding the request to another service. Hence, looking up a request cyle is just about quering the database for a particular correlation-id
- Offers fault-handling logic: every request queries the `apex-config-store` for authentication, routing, and retry logic in that order. Only after all three are completed are the requests forwarded to another service.
-  Does not rule out a transition to service-mesh architecture
- Processing logs asynchronously
- Persisting logs and config data in containers

### Limitations of Apex
- Not designed for high scalability and high availability, bc of the single point of failure
- Single point of failure
- Discounts the case of bursty traffic when the queue for processing logs is overwhelmed
- Requires multiple reads from the `apex-config-store`; this adds significant latency, but is an acceptable tradeoff under the assumption that the ones using apex are going to use it for connecting a small number of microservices

## Proposal:

Since one of the big criticisms of service mesh is that it is too complicated for simpler apps, we could explore if a service-mesh-lite is an option.

A service mesh lite option that facilitates a transition from molithic to microservices architecture.

There is an option like this already: [maesh](https://traefik.io/blog/announcing-maesh-a-lightweight-and-simpler-service-mesh-made-by-the-traefik-team-cb866edc6f29/) This project seems to receive a lot of positive [feedback](https://news.ycombinator.com/item?id=20876754). But this solution is closely tied up with Kubernetes cluster.

If we could think of a reverse-engineer maesh but for a simpler transition like apex, then it might be a viable project. We could think of a way of doing this for docker swarm.

However, this might be too ambitious for the time we have, since this will be a rather new territory.