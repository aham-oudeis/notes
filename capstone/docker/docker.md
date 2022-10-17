### Docker
Image is a standalone bundled content that can be spun into a container.

`docker run` : spin a new container from an image
`docker start`: re-spin the container that was stopped

to build from the dockerfile in the current directory
`docker build -t usename/repo .`

This creates an image in the docker daemon. This image can be run and/or pushed to dockerhub or other repository.

## Images
The blueprints of our application which form the basis of containers.

Images are composed of layers and hence downloading different versions require less time once one version is already downloaded.

artifact that can be moved around

## Containers
Created from docker images and run the actual application. `docker run`

it's the process running in the machine

### Daemon
The background service running on the host that manages building, running, and distributing docker containers. It is the process that runs in the operating systems which client talks to.

### Port Mapping
Since the containers are isolated environments, applications will have their own ports for each container they generate. For instance, two redis images will generate two different containers but at the same port 6379. 

To be able to relay all the messages from the local host to the container, we can map ports from the local host to the containers. Different applications need to be mapped with unique ports.

## Docker compose
It uses a yaml file.

