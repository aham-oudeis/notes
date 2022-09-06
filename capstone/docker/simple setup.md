## Running simple server
Consider the phonebook app created in the FSO course. 

We can set up the app to run in containers. 

We can run the mongo db in one container with the followings commands:
```
docker run -d \
-p 27017:27017 \
-e MONGO_INITDB_ROOT_USERNAME=admin \
-e MONGO_INITDB_ROOT_PASSWORD=password \
--net mongo-network \
--name mongodb \
mongo
```

1. Basically, we map the port of the container to the port in the local host with `p 27017:27017`.

2. The username and password of the mongodb is initialized with the environment option:
`-e MONGO_INITDB_ROOT_USERNAME=admin \
`-e MONGO_INITDB_ROOT_PASSWORD=password \`

3. then the network for the specific container is specified:
`--net mongo-network`

Aside: `docker network create mongo-network` creates the custom network

This spins up a container that runs the mongodb. This database can be connected with a UI with the use of the client mongo-express. 

The mongo-express can be running in a different container, but same network as the mongodb, as follows. 

```
docker run -d \
-p 8081:8081 \
-e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
-e ME_CONFIG_MONDODB_ADMINPASSWORD=mongodb \
-e ME_CONFIG_MONGODB_SERVER=mongodo \
--net mongo-network \
--name mongo-express \
mongo-express
```

