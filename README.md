# docker-webNUT

This repository is a fork of https://github.com/teknologist/docker-webnut.<br/>
It is based on it's content but this docker image includes updated dependencies.

webNUT (UPS network monitoring web ui) dockerized.

More infos on webNUT:  https://github.com/rshipp/webNUT

## Environment Variables

| Variable                      | Description                                                                | Default                          |
|-------------------------------|----------------------------------------------------------------------------|----------------------------------|
| UPS_HOST                      | The NUT server host IP                                                     | 127.0.0.1                        |            
| UPS_PORT                      | The NUT server port                                                        | 3493                             |
| UPS_USER                      | The NUT server username                                                    | monuser                          |
| UPS_PASSWORD                  | The NUT server  password                                                   | secret                           |

## Compose file

```sh
version: '3.3'
services:
  nut:
    # image: git.claeyscloud.com/david/webnut:latest
    image: ghcr.io/davidclaeysquinones/webnut
    environment:
       # adjust these variable as needed
       - UPS_HOST=10.11.12.13 
       - UPS_PORT=3493
       - UPS_USER="monuser"
       - UPS_PASSWORD="secret"
    restart: unless-stopped
    security_opt:
       - no-new-privileges:true
    ports:
       - 6543:6543
```


