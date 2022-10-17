## Data Replication
https://www.brianstorti.com/replication/

## Why?
1. For keeping data closer to users to save travel time. Latency is non-negotiable, for the most part.
2. At some point, vertical scaling will hit its limits and we will need a way to replicate the database to serve more users.
3. For redundancy purposes (makes the system fault tolerant)

## Asynchronous Replication
Suppose we have `n` number of databases. If one of our database say, `n1` gets a query for an update, how should the update propagate to all other databases?

One option is to send a confirmation back to the client as soon as the node that received the message has successfully written the data, and __then__ send this message to all the replicas (some of which may not be alive).
	- Problem with this would be when the read requests goes to the database that has not yet been updated. Suppose a user updates their profile picture, but when they refresh their page, the page they fetch is from the database that has not received the update yet.

That is, there will be __replication lag__.

Another issue is with durability. What if the database that gets updated fails before it can send the updates to other databases?

## Synchronous Replication
First we replicate the data in various databases and then send the confirmation to the client. 

No more replication lag or durability issue (not exactly but good enough)

Downsides: performance and availability.

User will have to wait for all the replicas to be in sync. That takes time.

The system will have to be unavailable if one of the replica is unresponsive.

## Semi-synchronous
Some replicas get updates synchronously and others get updates asynchronously.

