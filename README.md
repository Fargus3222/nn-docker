# Nexus Node

crypto node in docker container

For other info - https://nexus.xyz/


# Run

### 1.  pull image
``` bash
docker pull fargus3222/nnd:latest
```

### 2. run container
```
docker run -d --name nexus-docker fargus3222/nnd:latest
```


## docker-compose.yml

``` yml
version: '3.9'

services:
  nng:
    image: fargus3222/nnd:latest
    volumes:
      - ./nexus:$HOME/.nexus/
```
