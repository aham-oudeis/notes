`docker ps -a` :
		all containers in the machine
`docker logs name/id-of-container`: 
		for debugging purposes
`docker exec -it container/id /bin/bash`: 
		for navigate to the terminal of the container
`docker network create mongo-network`

to build an image from a dockerfile:
`docker build -t app-name .`

to remove images:
 `docker image prune --all`
 or `docker image --filter`

kill all docker containers:
`docker kill $(docker ps -q)`