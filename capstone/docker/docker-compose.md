# Steps
`docker-compose` is a `yml` file that orchestrates different services by using their respective dockerfiles. 

First, you need to have a dockerfile for each service you are going to use for running the containers.

```yml
version: "3.8"
services:
	frontend:
		build: ./client
		ports:
			- 1234:1234
	api:
		build: ./server
		ports:
			-5001:5001
		environment:
			DB:"${DB}"
	db:
		image: mongo:4.0-xenial
		ports:
			-27017:27017
```

