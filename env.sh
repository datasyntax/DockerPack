#!/bin/bash

#
# IP to bind common services (HTTP proxy, sync, DNS)
#
#  Docker for MAC: Usually 127.0.0.1 is OK.
#  Linux: determine with command "ip addr list docker0 | grep 'inet ' | cut -d' ' -f6 | cut -d'/' -f1"
#
#
export HOST_IP=127.0.0.1
export MAINTENANCE_DOMAINS=fotovakschool.com
