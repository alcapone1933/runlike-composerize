# runlike-composerize

[![Build Status](https://shields.cosanostra-cloud.de/drone/build/alcapone1933/runlike-composerize?logo=drone&server=https%3A%2F%2Fdrone.docker-for-life.de)](https://drone.docker-for-life.de/alcapone1933/runlike-composerize)
[![Build Status Branch Master](https://shields.cosanostra-cloud.de/drone/build/alcapone1933/runlike-composerize/master?logo=drone&label=build%20%5Bbranch%20master%5D&server=https%3A%2F%2Fdrone.docker-for-life.de)](https://drone.docker-for-life.de/alcapone1933/runlike-composerize/branches)
[![Docker Pulls](https://shields.cosanostra-cloud.de/docker/pulls/alcapone1933/runlike-composerize?logo=docker&logoColor=blue)](https://hub.docker.com/r/alcapone1933/runlike-composerize/tags)

### Runlike: "Output containers to docker run commands" 

### Composerize: "docker run commands to docker-compose"


### FORK
### The original is from Gitithub
### runlike: https://github.com/lavie/runlike
### composerize: https://github.com/composerize/composerize

&nbsp;

## Docker Cli


# Runlike

List all Container
```bash
docker container ls --format 'table {{.Names}}'

############################################
Example Output

NAMES
portainer
```

## Run runlike YOUR-CONTAINER 

```bash
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock alcapone1933/runlike-composerize:runlike YOUR-CONTAINER 
```

### Example

```bash
$ docker run --rm -v /var/run/docker.sock:/var/run/docker.sock alcapone1933/runlike-composerize:runlike portainer

# Output

docker run --name=portainer --hostname=aaaaaaaaaaaa --mac-address=aa:aa:aa:aa:aa:aa --env=PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
--volume=/var/run/docker.sock:/var/run/docker.sock --volume=portainer_data:/data --volume=/data --workdir=/ \
-p 8000:8000 -p 9000:9000 --expose=9443 --restart=always --runtime=runc --detach=true portainer/portainer-ee:latest
```

&nbsp;

## Run runlike YOUR-CONTAINER -p

This prints out what you need to run to get a similar container. You can do $(runlike container-name) to simply execute its output in one step.

-p breaks the command line down to nice, pretty lines. For example:

```bash

docker run --rm -v /var/run/docker.sock:/var/run/docker.sock alcapone1933/runlike-composerize:runlike -p YOUR-CONTAINER
```

### Example

```bash
$ docker run --rm -v /var/run/docker.sock:/var/run/docker.sock alcapone1933/runlike-composerize:runlike -p portainer

# Output

docker run  \
        --name=portainer \
        --hostname=aaaaaaaaaaaa \ --mac-address=aa:aa:aa:aa:aa:aa \
        --env=PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
        --volume=/var/run/docker.sock:/var/run/docker.sock --volume=portainer_data:/data \
        --volume=/data --workdir=/ \
        -p 8000:8000 \
        -p 9000:9000 \
        --expose=9443 \
        --restart=always \
        --runtime=runc \
        --detach=true \
        portainer/portainer-ee:latest
```

&nbsp;

## Run runlike YOUR-CONTAINER --stdin

Feeding it the output of docker inspect also works:

```bash
docker inspect <container-name> | docker run -i --rm alcapone1933/runlike-composerize:runlike --stdin

docker inspect <container-name> | docker run -i --rm alcapone1933/runlike-composerize:runlike --stdin -p
```
### Example

```
$ docker inspect portainer | docker run -i --rm alcapone1933/runlike-composerize:runlike --stdin

# Output

docker run --name=portainer --hostname=aaaaaaaaaaaa --mac-address=aa:aa:aa:aa:aa:aa --env=PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
--volume=/var/run/docker.sock:/var/run/docker.sock --volume=portainer_data:/data --volume=/data --workdir=/ \
-p 8000:8000 -p 9000:9000 --expose=9443 --restart=always --runtime=runc --detach=true portainer/portainer-ee:latest


$ docker inspect portainer | docker run -i --rm alcapone1933/runlike-composerize:runlike --stdin -p

# Output

docker run  \
        --name=portainer \
        --hostname=aaaaaaaaaaaa \ --mac-address=aa:aa:aa:aa:aa:aa \
        --env=PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
        --volume=/var/run/docker.sock:/var/run/docker.sock --volume=portainer_data:/data \
        --volume=/data --workdir=/ \
        -p 8000:8000 \
        -p 9000:9000 \
        --expose=9443 \
        --restart=always \
        --runtime=runc \
        --detach=true \
        portainer/portainer-ee:latest
```

&nbsp;

&nbsp;

# Composerize

```bash

docker run --rm alcapone1933/runlike-composerize:composerize <docker run command>

```

### Example

```bash
$ docker run --rm alcapone1933/runlike-composerize:composerize docker run -d \
  -p 8000:8000 -p 9000:9000 \
  --name=portainer --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data portainer/portainer-ee:latest
```
### Output
```yaml
version: '3.3'
services:
    portainer-ee:
        ports:
            - '8000:8000'
            - '9000:9000'
        container_name: portainer
        restart: always
        volumes:
            - '/var/run/docker.sock:/var/run/docker.sock'
            - 'portainer_data:/data'
        image: 'portainer/portainer-ee:latest'
```
