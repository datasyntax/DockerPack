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

if [ "$(uname)" == "Darwin" ]; then
    echo "Darwin detected"
elif [ "$(expr substr $(uname -s) 1 5 2>/dev/null)" == "Linux" ]; then
    echo "Linux detected"
elif [ "$(expr substr $(uname -s) 1 6 2>/dev/null)" == "CYGWIN" ]; then
    echo "Windows detected"
fi

# Create projects network if does not exist
docker network ls | grep "projects" 1>/dev/null 2>&1 || docker network create projects


docker-compose up -d --build --force-recreate
#docker exec vhost-proxy wget http://certs.datasyntax.tk/api.proofpilot.tk.crt -O /etc/nginx/certs/api.proofpilot.tk.crt
#docker exec vhost-proxy wget http://certs.datasyntax.tk/api.proofpilot.tk.key -O /etc/nginx/certs/api.proofpilot.tk.key
#docker exec vhost-proxy wget http://certs.datasyntax.tk/lime.proofpilot.tk.crt -O /etc/nginx/certs/lime.proofpilot.tk.crt
#docker exec vhost-proxy wget http://certs.datasyntax.tk/lime.proofpilot.tk.key -O /etc/nginx/certs/lime.proofpilot.tk.key
#docker exec vhost-proxy wget http://certs.datasyntax.tk/public.proofpilot.tk.crt -O /etc/nginx/certs/public.proofpilot.tk.crt
#docker exec vhost-proxy wget http://certs.datasyntax.tk/public.proofpilot.tk.key -O /etc/nginx/certs/public.proofpilot.tk.key
#docker exec vhost-proxy wget http://certs.datasyntax.tk/admin.proofpilot.tk.crt -O /etc/nginx/certs/admin.proofpilot.tk.crt
#docker exec vhost-proxy wget http://certs.datasyntax.tk/admin.proofpilot.tk.key -O /etc/nginx/certs/admin.proofpilot.tk.key
#docker exec vhost-proxy wget http://certs.datasyntax.tk/dutchfilmersacademy.tk.crt -O /etc/nginx/certs/dutchfilmersacademy.tk.crt
#docker exec vhost-proxy wget http://certs.datasyntax.tk/dutchfilmersacademy.tk.key -O /etc/nginx/certs/dutchfilmersacademy.tk.key
#docker exec vhost-proxy wget http://certs.datasyntax.tk/fotovakschool.tk.crt -O /etc/nginx/certs/fotovakschool.tk.crt
#docker exec vhost-proxy wget http://certs.datasyntax.tk/fotovakschool.tk.key -O /etc/nginx/certs/fotovakschool.tk.key
#docker restart vhost-proxy
