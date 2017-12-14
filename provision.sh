#!/usr/bin/env bash

if [ ! -f env.sh ]; then
    echo "Please run \"cp env.dist.sh env.sh\" and adjust your settings"
    exit
fi
source ./env.sh

# Create volume mapping file
if [ ! -f volume_mapping.rsync ]; then
    touch volume_mapping.rsync
fi
if [ ! -f volume_mapping.unison ]; then
    touch volume_mapping.unison
fi

arguments=$*

for i in "$@"
do
case $i in
    --set-lo0-ip)
    grep -q -F 'sudo ifconfig lo0 alias 10.200.10.1/24' /etc/profile || echo 'sudo ifconfig lo0 alias 10.200.10.1/24' | sudo tee --append /etc/profile
    sudo ifconfig lo0 alias 10.200.10.1/24
    exit
    ;;
    --dns)
    dns=1
    shift # past argument with no value
    ;;
    *)
    # unknown option
    ;;
esac
done

# Create projects network if does not exist
docker network ls | grep "projects" 1>/dev/null 2>&1 || docker network create projects


docker-compose up -d --build --force-recreate
