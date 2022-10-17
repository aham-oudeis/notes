# Communication
Once the services are distributed, they need to communicate with each other to coordinate the tasks. One single user action might have to go through various services throughout its lifecycle.

Now, all the issues of communication over a network comes into play:
## Communication Protocol
__How do the services communicate with each other? What protocol do they use to communicate?__
#### HTTP
#### gRPC
#### GraphQl

## Fault Handling
__What happens when some of the services are faulty or unreachable? What happens when some of the dependency services are down? __

### Circuit-breaker
### Retry-logic

## Rate Limiting
__Services might want to limit the requests to only a small set up other services. Where should that configuration reside?__

## [[Service Discovery]]
__Services might not have the same location. Especially since services are run in ephemeral containers, how would the services know where the other service is running?__

## Monitoring and Debugging
__If something has gone wrong in the system, how would one go about detecting the issue in the system?__

## Message Broker
__How should the messages between services be passed around?__
1. Kafka
2. RabbitMQ
3. Amazon SNS

## Contract Between Services
__How should the services agree on a contract so that updating one service requires minimal to no change in another service?__
### PACT
> tool for testing the contract for API endpoints

> contract tests assert that inter-application messages conform to a shared understanding that is documented in a contract

## API Management
Challenges
1. API documentation for easy consumption
2. Establishing cosistent policy on how to consume the API
3. API orchestration: figuring our which API is available to which service
4. API versioning

## Authorization, security
__Each service has to implement many kinds of concerns (cross-cutting concerns). Should the cross-cutting concerns be consolidated in a central place or should each service be required to handle it?__

1. How to authorize different services so that a request can seamlessly go through different services?
2. How to block unauthorized request to pass through services?

### Federated Authorization
### Delegated Authentication

If all of these concerns were to be handled in the same application where the core business logic is handled, then it would amount to mixing business logic with networking logic. Ideally, we would want to separate offload the networking concerns to a different layer. Why? Because mixing different concerns makes the code hard to maintain. Unless there is no plan to develop and update the code, having separation of concerns built in paves a viable path forward.

## Connection Type
__How do the services connect with the end users? Are the services directly connected to the client or do they have some proxy in between?__

### Service-to-service
### API Gateway
### Service Mesh
