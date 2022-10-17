## BackStory: Monolith to Microservices
![[Pasted image 20220926203152.png]]


![[Pasted image 20220926203301.png]]

In a microservice architecture, services talk to each other through api calls. For instance, `orders` service talks to the `shipping` service by making a `POST` request to `/shipments` endpoint.

Path towards microservices: dividing up different services that are independently deployable.

### Challenges of Microservices architecture
- Network is unreliable: hence, requires retry logic and circuit-breakers. Calls might be unsuccessful for various reasons. Other service might be down.
- Latency: hence, services making a call to others require hopping over networks, a complete cycle of a business transaction would require for the request to cyle through various services. Thus, adding latency.
- Debugging or diagnosing network faults is cumbersome: tracing the request through the services. The error logs are distributed across the system.
- Managing fault-handling logic: where should all the rety-logic be defined? 
		- is it in the http library that are imported in each service's code?
		- there are packages for handling the rety logic
		- there are also packages for handling logging, caching, rate-limiting, authentication
		- api-producers might provide their own framework that handles these issues

> Needless to say, this solution becomes less and less manageable as the number of services grows. Every time a new service is built in a new language, every other service owner must write a new client library in that language. More critically, updating fault-handling logic now incurs a great deal of repetitive work. Suppose the CTO wishes to update the global defaults for the retry logic; developers would now have to update the code in multiple client libraries in every service, then carefully coordinate each service’s redeployment. The greater the number of services, the slower this process becomes. [source](https://apex-api-proxy.github.io/)

![[Pasted image 20220926204548.png]]


![[Pasted image 20220926204627.png]]

A proxy is a server that sits on the path of network traffic betwen two communicating machines, and intercepts all their requests and responses. It's the job of the proxy to forward the request to the appropriate servers. At this stopping-point, all the features are implemented. The issues with authentication, traffic control, rate-limiting. When the proxy receives a response, it forward it to the right place.