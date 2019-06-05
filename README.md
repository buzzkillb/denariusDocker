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
**--name=denariusd** (name of container)  
**-v ~/.denarius** (path of chaindata on your vps or pc)  

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
Launch using Docker Compose  
install Docker Compose - Linux  
https://docs.docker.com/compose/install/  
Example 3 FortunaStakes  
Create **docker-compose.yml**  
```
FS01:
  image: buzzkillb/denariusd:latest
  volumes:
    - ~/D/MN01:/data
FS02:
  image: buzzkillb/denariusd:latest
  volumes:
    - ~/D/MN02:/data
FS03:
  image: buzzkillb/denariusd:latest
  volumes:
    - ~/D/MN03:/data
```
To launch your node, simply type docker-compose up:  

`docker-compose up -d`  # start denariusd in the background  
or  
`docker-compose up` # watch all printoconsole in realtime as denariusd starts up  
`docker-compose ps` # show running processes  
`docker-compose down` # stop denariusd (blockchain data will remain on disk)  

To watch logs to check for which FS's are active.  
```
docker-compose logs | grep "CActiveFortunastake::Dseep"
```

**Huge thanks to EtherGem for Docker tips**
