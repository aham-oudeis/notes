# Why api gateway?
1. helps to stop exposing internal concerns to external clients
2. provide additional security to microservices
3. merge the communication protocols
4. decrese the complexity of microservices
5. separate the microservices API and other external APIs to virtualize the design requirements for testing

The main aim of the microservices API gateway is to speed up the development of services independently. Facilitates independent teams to publish, update, and monitor the microservices independently and effectively.

Some difference between traditional api gateway and microservices api gateway: why the specialization?

Problem: if the client has to reach different microservices, say orders, shopping cart, review, shipping, then there would be too many different apis to maintain. This can get ulgy very quickly.

Scalability and performance of API gateway are usually essential. API gateway is generally responsible for: routing, billing, monitoring, rate limiting, authentication, security, alerts, policies, etc.

[[API management system]]

[[Service discovery]]

API gateway needs to handle the partial failure of the system when one service calls another service that is responding slowly or is absent.

[[Backend for Frontend Pattern]]

[[Data transformation]]
Sometimes the data returned by a service is not exactly the one that is needed for the frontend. In that case, API gateway can be configured to handle the transformation of the data. 

Scalable API gateway: `Netty`, `JBoss Undertow`

Reactive Programming Model: 
Sometimes, the api gateway has to address some requests by invoking multiple backend services and combining the overall results. For example: before fetching the wishlist, the api gateway would have to first call the authentication service and then call the products services in the backend.

There might be dependencies between the requests.

Service invocation: How do the services interact? Asynchronously (what mechanism?) or synchronously (HTTP) or both?
[[Message brokers for microservices]]

Service discovery: a non-trivial problem when the location of the service keeps changing.

Fault handling: 
Netflix's Hysterix: Hystrix implements a circuit breaker pattern to stop the client from waiting for the failed services to respond. It trips the circuit breaker, which eventually fails all the requests immediately if the error rate for the service exceeds the specified threshold. It helps to time out the calls that exceed the threshold. If you are working with JVM, it is recommended to use Hystrix, and if you are working with a non-JVM environment, you should use an equivalent library.

[[API Composition]]

# API Gateways

Problem: Say, the 3-tier architecture is broken into several (not a whole lot) micoservices. Should the client directly connect with all the different microservices, say orders, shopping cart, review, shipping, or should there be some systematic way of organizing all the different services?

What’s the problem with connecting directly with different microservices?

1.  the more direct the line of communication, greater is the dependency and coupling
2.  more coupling makes maintenance harder
3.  direct connections leads to a greater attack surface area (security concern)
4.  services are limited by the protocol of the client

# Why?

1.  helps to stop exposing internal concerns to external clients (internal services need not be accessible to external clients; such exposure would enlarge the attack surface area)
2.  provide additional security to microservices (hiding the services behind the gateway)
3.  merge the communication protocols (while the client may request information with REST protocol, the internal services might be communicating over gRPC )
4.  decrease the complexity of microservices (separating the networking concerns onto a distinct component)

API gateway is a solution to all these problems. By putting a gateway between client and the internal services, one can consolidate the networking logic in one place and reduce the attack surface area.

Key companies: Nginx, kong, tyk

Tradeoffs:

1.  vendor lock in: taking on one vendor makes it harder to change things later on
2.  adds one more hop in the network: latency
3.  gateways tend to have a cluster of properties, but not all those properties are needed for all kinds of gateway requirements.
    1.  external facing gateways need to implement load balancing, rate limiting, routing, authentication
    2.  internal gateways may not need all those features