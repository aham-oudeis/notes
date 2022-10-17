## Why microservices?

### Business needs:
1. Makes scaling flexible
2. Makes deployment faster

### Engineering needs:
#### Must
1. Some part of your monolithic application is overloaded than another.
2. Need to isolate a system and scale it independently.

#### Nice to have
Some nice aspects of well-designed microservices:
1. smaller and simpler codebases
2. simpler deployment

You need a way of measuring the impact of transitioning to microservices. What kind of metrics to use?

Once you extract a service from your monolith (say, the review services that is not quite central to your business), how would the user be able to reach the micro-service?

### Downsides:
1. Complexity is pushed on the communication part.
2. Network issues come into play: latency, partial failures, connection limits, timeouts, dropped packets
3. Attack surface is greater as there are more components to the overall architecture
4. While there are simpler codebases for each services, the overall workings of the system gets harder to reason about.
5. Testing your overall system becomes much more complicated.
