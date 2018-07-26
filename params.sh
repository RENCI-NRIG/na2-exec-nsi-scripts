# used with -l option of onsa-provision.sh to generate sane values for provisioning parameters. 

GUID=urn:uuid:`uuidgen`

SRC="es.net:2013::sunn-cr5:10_1_6:+#vlan=1779"
DST="es.net:2013::chic-cr5:5_1_1:al2s#vlan=1779"
BW="100"
START=`date -u -v+1d "+%Y-%m-%dT%H:%M:%S"`
END=`date -u -v+1d -v+30M "+%Y-%m-%dT%H:%M:%S"`
#START="2018-07-26T20:00:00"
#END="2018-07-27T20:30:00"
