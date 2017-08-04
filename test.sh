#!/usr/bin/env bash
docker run -it --rm -p 80:5000 --name web -v /repos/docker/docker-python-oracle/api:/opt/data/api web bash