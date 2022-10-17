## Basic Problem
1. Every service goes through scale up and scale down cycle
2. One machine may be running one service at one time and another service at another time.
3. Numbers of instance are not constant
4. Machines may crash.

Nevertheless, services need to find each other systematically to communicate. Hence, there is a need for a service discovery. Depending on what sort of container solutions you are using, you may already have a built-in service discovery. Kubernetes provides a built-in solution. Likewise, docker also provides one (although there have been a lot of complains regarding service discovery in docker swarm).

However, most of the available solutions require running the containers in the same environment. That means, for companies that are running different services in different environment, say different cloud services and different containerized solutions, there is not a whole lot of solutions.
https://engineering.atspotify.com/2022/03/incident-report-spotify-outage-on-march-8/

In order to provide a service discovery that works across different environments, the solution is to either go with vendors ( costs money: `consul`, `etcd`, `zookeeper` ) or grow your own (time consuming ). (Are there open souce solutions for this project?)

## Challenges of creating a highly available service discovery

In cloud, we need a dynamic registry that keeps track of the available nodes. Some of the tricky questions around service discovery involve the same kind of tradeoffs that CAP theorem talks about. 

What kind of information should the service discovery have and how should it get that information?

### What information
1. Which of the machines in the datacenter have the recommendations service software deployed?
2. Which of them are available for processing the incoming request?

### How to get that information
1. should the services be responsible for providing that information to the registry?
2. should the registry be fetching that information from another source, say the orchestration platform?

## Reasoning about unavailable services
Suppose a service is in the registry. But the service could be either in the two states:
1. Instance is up and running
2. It shut down without the information getting to the registry.

Being available is a local phenomenon. A service may be available to one but not to another. Hence, service discovery does not guarantee node availability.

## However, unavailability can be trusted
There is more cost associated with service discovery giving false positives (if a service is registered as available but it is infact not available, then it will add latency; but if the service is deemed unavailable but it is in fact available, then there is not much of a loss). False negatives are acceptable.

> Service discovery controls visibility but does not guarantee availability

That is, if a service is not visible, then no other nodes will try to connect with it; but it is possible that service discovery tells that a node is visible but in fact it is not actually available or that (in a rather tricky manner), the node is actually running a different service instance.

## High availability is a strong requirement for service discovery
Scaling up requires adding more instances of the services, but what if the service discovery is down at that time?

How to make service discovery scalable?

What kind of compromise of consistency are we accepting? (you might route requests to wrong instances where different services are running) Does not happen a whole lot.

## Storing ephemeral data

As long as some service-discovery is available, information about the service is stored even if inconsistent. Since the information is updated regularly, the compromise on consistency is not costly.
