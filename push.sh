#!/bin/sh
echo -n 'Enter new tag version (i.e. "0.0.1"): '
read version
docker image tag micro-express jaymartmedia/micro-express:$version
docker image push jaymartmedia/micro-express:$version
