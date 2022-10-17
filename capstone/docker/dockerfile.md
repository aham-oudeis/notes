# DockerFile
### A blueprint for building the docker image

```Dockerfile
FROM node:13-alpine //this references the base node image

ENV MONGO_DB_USERNAME=admin\
		MONGO_DB_PASSWORD=password

RUN mkdir -p /home/app

COPY . /home/app

EXPOSE 

CMD ["node", "/home/app/server.js"]
```

The line `From node:13-alpine` ensures that when the dockerimage is run, the container already has node version 13-alpine installed inside the container. This is the base image from which the interim container is built.

It's better to put the `ENV` variable inside of the docker-compose than to put in the dockerfile. WHY? 

The line `RUN mkdir -p /home/app` runs the command in the container. It creates the `/home/app` folder inside the container.

The line `COPY . /home/app` copies files from the current folder in the local machine to the directory `/home/app` inside of the container

> `ADD` is another command for copying files from remote source.

The line `CMD ["node", "/home/app/server.js"]` is an entrypoint to the container. It starts the app with the command `node server.js` from inside the container. Since the container starts the terminal in the root directory, to run the file we should specify the location of the file. Or change the directory to `/home/app` and then we can run the command.

```Dockerfile
FROM node:13-alpine

#ensures that all the commands are run from this directory
WORKDIR /home/app
```

To build a docker image from the dockerfile: `docker build -t app-name:1.0 .`

The last `.` specifies where the the dockerimage is to be downloaded.

## Best Practices
1. Order of the commands matter: put the least changing on the top and put the most changing around the bottom.
2. Use official image to install all the dependencies: there are official images that already contain what you need.
