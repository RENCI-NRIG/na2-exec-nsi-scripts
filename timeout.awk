BEGIN {
	to=0;
	metainfo="";
}
/CallbackTimeoutError/ {
	to=1;
	metainfo=$5;
}
END {
	if ( to > 0) {
		print "ERROR: NSI Timeout for ", metainfo;
		exit 1;
	} 
}
