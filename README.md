# denariusDocker
![Docker Automated build](https://img.shields.io/docker/automated/buzzkillb/denariusd.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/buzzkillb/denariusd.svg)  
Denarius wallet daemon compiled using Ubuntu 18 and compiled openssl 1.0.1j  
https://cloud.docker.com/u/buzzkillb/repository/docker/buzzkillb/denariusd

**denarius.conf cannot have daemon=1 in it  
and you must create a denarius.conf with rpcuser and rpcpassword before starting**  
Sample Run  
```
docker run --name=denariusd --rm -t -d -v ~/.denarius:/data -P buzzkillb/denariusd
```
Tail container to watch action  
```
docker logs denariusd -f
```
Find container name  
```
docker ps
```
Stop Container  
```
docker stop denariusd
```
To update to latest daemon image  
```
docker pull buzzkillb/denariusd:latest
docker stop denariusd
docker run --name=denariusd --rm -t -d -v ~/.denarius:/data -P buzzkillb/denariusd:latest
```
Hint on running FortunaStakes  
```
docker pull buzzkillb/denariusd:latest
docker stop FS01
docker run --name=FS01 --rm -t -d -v ~/D/FS01:/data -P buzzkillb/denariusd:latest
```
Huge thanks to EtherGem for Docker tips
