# Overview

This project contains a simple express web app that can be used for network testing or experimentation purposes.

The primary reason I built this is to test and demonstrate how network concepts such as reverse-proxies, load-balancers, etc. work. For example, running multiple micro-express containers with different instance ids behind a load balancer allows you to verify that the load balancer is distributing requests between instances. Or that a reverse proxy is sending requests to the expected upstream server based on some criteria. See my [nginx playground repository](https://github.com/JayMartMedia/nginx-playground) for some examples.

# How to run

The pre-built docker images are available on the Docker hub for your convenience (https://hub.docker.com/r/jaymartmedia/micro-express). If you would like to build the image for yourself see the [build from source](#build-and-run-from-source) section.

To run a single instance: `docker run -d -p 7000:3000 --name 000 -e MESSAGE="Hello from instance #000" -e INSTANCE_ID="000" jaymartmedia/micro-express:0.0.1`

To run a few instances: `./run-multiple.sh`

# How to use

Once a container is running, you can use the browser, cURL, or another http client to test access.

`curl http://localhost:7000` -> used to verify which instance is being accessed

`curl http://localhost:7000/endpoint` ->  used to verify that requests can access the path/subdirectory since this is sometimes broken by a reverse-proxy

`curl http://localhost:7000/headers` -> used to test which headers get to the micro-express instance. This is useful if the container is behind a reverse-proxy that may filter out or modify headers

# Build and run from source

`./build.sh`

`docker run -d -p 7000:3000 --name 000 -e MESSAGE="Hello from instance #000" -e INSTANCE_ID="000" micro-express`

# FAQ

Q. Isn't it inaccurate to use "micro" to describe an HTTP API that uses a runtime such as Node, and uses multiple libraries?

A. I don't disagree with you, I guess micro refers to the functionality. A single executable file would definitely be more "micro".