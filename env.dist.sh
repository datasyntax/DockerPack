#!/bin/bash

#
# IP to bind common services (HTTP proxy, sync, DNS)
#
#  Docker for MAC: Usually 127.0.0.1 is OK.
#  Linux: determine with command "ip addr list docker0 | grep 'inet ' | cut -d' ' -f6 | cut -d'/' -f1"
#
#
export DNS_PORT_MAPPING="127.0.0.1:53:53"
export OPENVPN_PORT_MAPPING="127.0.0.1:1194:1194"
export MAINTENANCE_DOMAINS=sitenotfound.com
export LOCAL_DOMAINS="-A /yourlocaldomain1.tk/127.0.0.1  -A /yourlocaldomain2.tk/127.0.0.1"
