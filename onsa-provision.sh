#!/bin/bash

. ./env.sh

OPTS=`getopt -o g:s:d:b:a:e:hl: -n 'onsa-provision.sh' -- "$@"`

if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi

eval set -- "$OPTS"

GUID=""
SRC=""
DST=""
BW=""
START=""
END=""

while true; do
  case "$1" in
    -g ) GUID="$2"; shift 2 ;;
    -s ) SRC="$2"; shift 2 ;;
    -d ) DST="$2"; shift 2 ;;
    -b ) BW="$2"; shift 2 ;;
    -a ) START="$2"; shift 2 ;;
    -e ) END="$2"; shift 2 ;;
    -h ) echo "Global ID URN (-g), source STP (-s), destination STP (-d), bandwidth (-b), start time UTC (-a), end time UTC (-e). Load parameters (-l)"; exit 0 ;;
    -l ) . $2; echo $GUID > .lastguid ; shift 2 ; break ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

if [[ "$GUID" = "" ]] || [[ "$SRC" = "" ]] || [[ "$DST" = "" ]] || [[ "$BW" = "" ]] || [[ "$START" = "" ]] || [[ "$END" = "" ]] ; then
        echo "Must specify all parameters. Try -h";
        exit 1;
fi

pushd $ONSA_DIR 2>&1 > /dev/null

./onsa reserveprovision \
        -g $GUID \
        -d $SRC \
        -s $DST \
        -b $BW \
        -a $START \
        -e $END \
        -u $ONSA_SVC \
        -p $ONSA_PA \
        -r $ONSA_RA \
        -h $ONSA_HOST \
        -o $ONSA_PORT \
        -l $ONSA_CRT \
        -k $ONSA_KEY \
        -i $ONSA_CRTBUNDLE \
	$ONSA_FLAGS | awk -f $CURD/timeout.awk

ONSA_EXIT=$?

if [[ $ONSA_EXIT = "0" ]] ; then
	
	./onsa query \
		-g $GUID \
		-u $ONSA_SVC \
		-p $ONSA_PA \
		-r $ONSA_RA \
		-h $ONSA_HOST -o $ONSA_PORT \
		-l $ONSA_CRT \
		-k $ONSA_KEY \
		-i $ONSA_CRTBUNDLE \
		$ONSA_FLAGS | awk -f $CURD/get-conn-ids.awk
fi

popd 2>&1 > /dev/null

exit $ONSA_EXIT
