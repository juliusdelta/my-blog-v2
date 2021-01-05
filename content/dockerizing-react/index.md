+++
title = "Dockerize Create React App"
description = "I'm relatively new to using Docker and wanted a quick way to spin up a small React application using Docker so I could easily share it as a proof of concept for features I develop at work. Here's a quick guide to dockerizing a React app made with create-react-app."
slug = "dockerizing-react"
date = 2021-01-02
draft = true

[taxonomies]
categories = ["development"]
tags = ["react", "docker"]
+++

I've used Docker quite a bit but I haven't really dived into configuring my own dockerized app. I recently needed to build a quick proof of concept with a React app and needed to share it easily without worrying too much about build dependencies or anything of the sort. So here's a quick guide on dockerizing an app created with create-react-app.

## The guide

I'll assume you already have a CRA app created. If you've never used create-react-app, I recommend checking out the docs [here](https://reactjs.org/docs/create-a-new-react-app.html). This tutorial will work from the top down and both the Dockerfile and docker-compose.yml files will be at the end in full.

Create a `Dockerfile` at the root of your application. First we need to figure out what base image we're going to use. I'm biased towards the Alpine based ones cause those are lite and quick to spin up. So we'll use `node:current-alpine3.10`. This tells Docker to pull the current alpine 3.10 image from Dockerhub. 

```dockerfile
FROM node:current-alpine3.10
```

Next we'll need to set the working directory, where the app will be "put", dependencies will be installed in, and our run command to run.

```dockerfile
WORKDIR /app
```

We'll setup the `PATH` to ensure that the `node_module` binaries are accessible globally.
```dockerfile
ENV PATH /app/node_modules/.bin:$PATH
```

Next is probably the part that confused me the most when working with Docker. We have to copy over critical files to ensure that the container knows where to get our dependencies and how to build them all. This step needs to be done explicitely and not make use of a volume due to the fact that it'll overwrite dependencies if you're not careful.

```dockerfile
COPY package.json ./
COPY yarn.lock ./
```

This ensure that just the dependency and depenency lock file are both available to the container. We _could_ just copy over the `node_modules` folder from our local machine into the container, but it's likely that something will break cause sometimes certain modules are built for their target machine. 

Next we'll tell the container to install the dependencies.
```dockerfile
RUN yarn install
```

Finally we'll tell the container to execute our build/run command. This command is important cuase it represents the "main" process for our image which is why this is `CMD` instead of `RUN`.

```dockerfile
CMD ["yarn", "start"]
```

Before we move on we'll need to go ahead and setup the docker-compose.yml and `.dockerignore` files to ensure everything runs as inteneded. The convience of docker-compose is that you don't have to pass 100 args to the Docker CLI.

Lets setup the `.dockerignore` first.
```
node_modules
build
.dockerignore
Dockerfile
```
This ensures that Docker doesn't use the node_modules or `build` directory in the volume we create in the docker-compose.yml. Not ignoring the `node_modules` directory will result in our previously installed dependencies being overwritten by what's on our local machine. So lets make sure the container uses the dependencies it has.

Ok now for the last bit, the docker-compose file. First we need to set a version and setup the service name. This service name.


**Dockerfile**
```dockerfile
FROM node:current-alpine3.10

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package.json ./
COPY yarn.lock ./

RUN yarn install

CMD ["yarn", "start"]
```

**.dockerignore**
```dockerfile
node_modules
build
.dockerignore
Dockerfile
```

**docker-compose.yml**
```yml
version: '3.3'

services:
  wc-concept:
    container_name: wc-auth-concept
    build:
      context: .
      dockerfile: Dockerfile
    volumes:
      - '.:/app'
      - '/app/node_modules'
    ports:
      - 3001:3000
    environment:
      - CHOKIDAR_USEPOLLING=true
```
