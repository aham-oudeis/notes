### PaaS
It's tedious to build and configure servers from scratch.

Issues with Heroku:
- Price: scaling dynos vertically or horizontally (cost intensive)
- Uses AWS infrastructure.
- Apps in free tier are put to sleep and are woken up when it gets request from users.

Expectations of PaaS:
- error logs
- easy scalability
- rollback features for apps

Heroku features:
- getting started with heroku is very easy
- excellent error logs
- scaling is easy
- add-ons make it easy to add new features and technologies
- dedicated servers prevent "out of memory errors"

The overall challenges of building a PaaS (like Heroku) can be broken down to the following key parts:
1. Provisioning resouces for varieties of applications.
3. Connecting all the provisioned resources.
4. Horizontally scaling the application as the number of deployed applixation grows.

### Provisioning resouces for varieties of applications
Should it pursue __single tenancy__ (each application runs in a single vps) or __multi tenancy__ (many apps can run in a single vps)? 

Single tenancy has the following benefits:
		- routing requests to individual apps is easy: each app is assigned its own distinct ip address
		- each application has access to predictable amount of resources (RAM, storage)
		- apps are separated: no concern with one app hogging all the resources or security breaches between apps

Downsides:
		- provisioning a new VPS for each new app takes much longer
		- waste of resources: small apps are unlikely to need the full resources of even  a modest  VPS

Multi tenancy amounts to running multiple applications concurrently on the same server. Muti tenancy allows for better resource utilization, but comes with its own unique challenges.

#### Problems with Multi tenancy
1. __Security concern__: if the different applications are not isolated, then breach of one app implies that all others are compromised.
2. __Application dependency__:  applications may require different versions of language (node 14 vs. node 10)

#### Containerization
1. How to containerize the application? 

Buildpack: tools that determine the dependencies of the app and configure the app to communicate with bound services. Buildpack contains a set of instructions for generating a suitable environment in which an application can run. (Before buildpack, one would have to manually set up the environment for the relevant app)

Copy the code to a container. Execute the buildpacks agains the application source code. Then the result is stored as a Docker image. (use __Herokuish__)

![[Pasted image 20220922194142.png]]

This architecture only allows for a small number of apps. Doesn't scale.

What we need is a fleet of nodes that can run various instances of the app.

![[Pasted image 20220922194450.png]]

So far, many different apps are running in many different nodes, with each node running multiple containers. Here, each app is just running on one container. These containers are pretty ephemeral.

### Connecting the provisioned resources
Now that the nodes are split up, there are unique set of challenges with connecting the provisioned resources.

Challenges
1. Where should a newly deployed application go?
2. Is there a way to tell which node is the application running on?
3. If a node is added to the fleet, how should the application be rebalanced?
4. If a node crashes, how should the application be redistributed?

These are just the challenges of orchestrating containers. 

> We tell the container orchestrator which services should be on our system, and the container orchestrator is responsible for starting appropriate containers and distributing them amongst the nodes. If a container dies, the orchestrator must discover this (typically via heartbeat checks) and start a new container. It is also responsible for keeping track of available nodes and how to network them.

Docker swarm vs Kubernetes

Now that we have a container orchestrator dynamically distributing tasks across our fleet of application nodes, we have two additional problems to solve:

-   How do services talk to one another? In particular, how does an app talk to its database?
-   How do we route incoming requests from the Internet to the appropriate service?

.
### Use Cases
- teams needing to quickly deploy small applications for internal use