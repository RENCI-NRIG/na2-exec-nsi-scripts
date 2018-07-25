#!/bin/bash

. ./env.sh

OPTS=`getopt -o c:g:h -n 'onsa-query.sh' -- "$@"`

if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi

eval set -- "$OPTS"

CONNID=""
GUID=""

while true; do
  case "$1" in
    -c ) CONNID="$2"; shift 2 ;;
    -g ) GUID="$2"; shift 2 ;;
    -h ) echo "Connection id (-c) or Global id (-g) is required"; exit 0 ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

if [[ "$CONNID" = "" ]] &&  [[ "$GUID" = "" ]]; then
	echo "Must specify one of -c or -g or -h"
	exit 1;
fi

pushd $ONSA_DIR 2>&1 > /dev/null

if [[ $CONNID != "" ]]; then
	./onsa query \
		-c $CONNID \
		-u $ONSA_SVC \
		-p $ONSA_PA \
		-r $ONSA_RA \
		-h $ONSA_HOST -o $ONSA_PORT \
		-l $ONSA_CRT \
		-k $ONSA_KEY \
		-i $ONSA_CRTBUNDLE \
		$ONSA_FLAGS
else
	./onsa query \
		-g $GUID \
		-u $ONSA_SVC \
		-p $ONSA_PA \
		-r $ONSA_RA \
		-h $ONSA_HOST -o $ONSA_PORT \
		-l $ONSA_CRT \
		-k $ONSA_KEY \
		-i $ONSA_CRTBUNDLE \
		$ONSA_FLAGS
fi

popd 2>&1 > /dev/null
