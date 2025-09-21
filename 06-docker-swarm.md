# Docker Swarm

## Install Docker

Follow https://www.thomas-krenn.com/de/wiki/Docker_Installation_unter_Ubuntu_24.04.

## Initialize Docker Swarm on Node 1

sudo docker swarm init --advertise-addr 192.168.178.39

## Add Node2 and Node3 as nodes to Docker Swarm

sudo docker swarm join --token <TOKEN_COPIED_FROM_DOCKER_SWARM_INIT_ON_NODE_1> 192.168.178.39:2377

## Check Docker Swarm on Node Manager

leo@node1:~$ sudo docker node ls
ID                            HOSTNAME   STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
ja7c2ob7hiwpfnjomvzfzfk1u *   node1      Ready     Active         Leader           28.1.1+1
u1ikyslwoistoa8aualiphh2e     node2      Ready     Active                          28.4.0
jo0t9rpxv095asco5acmuc93u     node3      Ready     Active

## Deploy Service on Docker Swarm

Follow https://docs.docker.com/engine/swarm/swarm-tutorial/deploy-service/.
