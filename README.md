# denariusDocker
Denarius wallet daemon compiled using Ubuntu 18 and compiled openssl 1.0.1j  
https://cloud.docker.com/u/buzzkillb/repository/docker/buzzkillb/denariusd

Sample Run  
```
docker run --name=denariusd --rm -it -d -v ~/.denarius:/root/.denarius -P buzzkillb/denariusd
```
**Sample to go into container**  
Find container name  
```
docker ps
```
Go into container  
```
docker exec -ti 04a53c0913a9 bin/bash
```
