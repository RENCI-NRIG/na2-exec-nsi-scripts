#!/bin/bash

# environment settings for all OpenNSA scripts

ONSA_SVC="https://nsi-aggr-west.es.net:443/nsi-v2/ConnectionServiceProvider"
ONSA_PA="es.net:2013:nsa:nsi-aggr-west"
ONSA_RA="exogeni.net:2018:nsa:requester"
ONSA_HOST="152.54.3.45"
ONSA_PORT="9443"
ONSA_CRT="$HOME/.ssl/NSI/nsi-ibaldin.crt"
ONSA_KEY="$HOME/.ssl/NSI/nsi-ibaldin.key"
ONSA_CRTBUNDLE="$HOME/.ssl/NSI/etc/ssl/certs/"
ONSA_FLAGS="-x -z"

ONSA_DIR="$HOME/opennsa-master/"
CURD=`pwd`
