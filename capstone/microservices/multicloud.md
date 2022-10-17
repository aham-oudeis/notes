## Multicloud
- cloud services from different providers
- they are not interconnected; they can be connected through internet

## Benefits 
#analogy(don't put all eggs in the same basket)
1. vendor lock-in
2. competitive pricing
3. high availability and resiliency
4. flexibility and scalability
5. enhanced risk management

## Multicloud deployment is complex
because, each cloud provider has its own kind of configuration

OpenShift provides the common ground for multiple cloud providers

It makes it easy to deploy in different environment. tooling is consistent.

Nevertheless, cluster networking is difficult: Enter 
#product Skupper
1. provides hybrid service interconnect
2. connect any service running anywhere
3. lightweight, user-space, developer deployable
4. don't have to expose your services on the public internet