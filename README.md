# denariusDocker
Denarius wallet daemon compiled using Ubuntu 18 and compiled openssl 1.0.1j

Sample Run  
```
docker run --name=denariusd --rm -it -d -v ~/.denarius:/root/.denarius -P buzzkillb/denariusDocker
```
Sample to go into container  
```
docker exec -ti 04a53c0913a9 bin/bash
```
