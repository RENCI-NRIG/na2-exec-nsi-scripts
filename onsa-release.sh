#!/bin/bash

. ./env.sh

OPTS=`getopt -o c: -n 'onsa-release.sh' -- "$@"`

if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi

eval set -- "$OPTS"

CONNID=""

while true; do
  case "$1" in
    -c ) CONNID="$2"; shift 2 ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

if [[ "$CONNID" = "" ]] ; then
	echo "Must specify -c "
	exit 1;
fi

pushd $ONSA_DIR 2>&1 > /dev/null

./onsa release \
	-c $CONNID \
	-u $ONSA_SVC \
	-p $ONSA_PA \
	-r $ONSA_RA \
	-h $ONSA_HOST -o $ONSA_PORT \
	-l $ONSA_CRT \
	-k $ONSA_KEY \
	-i $ONSA_CRTBUNDLE \
	$ONSA_FLAGS | awk -f $CURD/timeout.awk

ONSA_EXIT=$?

popd 2>&1 > /dev/null

exit $ONSA_EXIT
