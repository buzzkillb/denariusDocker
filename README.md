# denariusDocker
![Docker Automated build](https://img.shields.io/docker/automated/buzzkillb/denariusd.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/buzzkillb/denariusd.svg)  
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
To update to latest daemon image  
```
docker pull buzzkillb/denariusd:latest
docker stop denariusd
docker rm denariusd
docker run --name=denariusd --rm -it -d -v ~/.denarius:/root/.denarius -P buzzkillb/denariusd:latest
```
Hint on running FortunaStakes  
```
docker pull buzzkillb/denariusd:latest
docker stop FS01
docker rm FS01
docker run --name=FS01 --rm -it -d -v ~/D/FS01:/root/.denarius -P buzzkillb/denariusd:latest
```
Huge thanks to EtherGem for Docker tips
