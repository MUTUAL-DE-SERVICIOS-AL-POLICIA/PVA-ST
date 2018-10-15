# Help Desk

## Requirements

* (Optional) LDAP server to authenticate users
* [Docker 18.06.1 or up](https://www.docker.com/)

## Install

* Clone the project

```sh
git clone https://github.com/MUTUAL-DE-SERVICIOS-AL-POLICIA/PVA-ST.git
cd PVA-ST
```

* Build the translated image

```sh
docker build -t zammad/zammad:es -f ./Dockerfile .
```

* Run an instance of the created image

```
docker container run -ti --restart=always --name zammad --network ldap_default --link ldap -p 8080:80 -v zammad-db:/var/lib/postgresql/9.6/main -d zammad/zammad:es
```

* The values of `network` and `port` are suggested and those can be identified by:

```sh
ss -tlnp
docker network ls
```