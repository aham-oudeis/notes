### Migration
Problem of separating the database for a specific microservice:
1. First, separate the database on which your new service relies on. 
		1. This requires copying the data from the old database to new
		2. Or, one could also set up the service to call an api in the monolith for getting the data; at any rate, the database would have to be separated for the services.
		For this task, we need some kind of background process for copying the data from one database to another. We might rely on some AWS Lambda to do run that process in the background.

Problem of deploying a new service that talks to the monolith:
2. Once the database is setup, we can create a new microservice that can take the requests and talk to the monolith if necessary. It is also possible to have the monolith make these requests to the microservices. Dockerize the new service and deploy it. (Where to deploy it? Deployment platforms: AWS, google Cloud, Digital Ocean)

--> AWS connect provides a direct connection from AWS services to the monolith: to avoid latency involved in having an api gateway in the cloud when your monolith is on-premise.

Problem of routing the request to the new service:
3. How would redirection of the traffic work? What part of the setup do we have to manipulate for the routing to work properly? (This requires configuring the setup in the api gateway. Seems like the thing we did for nginx for our vps project.)
4. Where are your services and monolith deployed? (Depending on where your monolith is deployed, you might need different strategies for deployment)