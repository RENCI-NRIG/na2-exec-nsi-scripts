function stripLast(str) {
	return substr(str, 1, length(str)-1);
}
BEGIN {

	rsm[""]=0;
	psm[""]=0;
	lsm[""]=0;
	dpactive[""]=0;
}
/^Connection/ {
	connection=$2;
}
/^States/ {
	rsm[connection]=stripLast($2);
	psm[connection]=stripLast($3);;
	lsm[connection]=$4;
}
/^Dataplane/ {
	dpactive[connection]=stripLast($4);
}
END {
	for (conn in rsm) 
		if (conn != "") {
			print conn, "\t", rsm[conn], "\t", psm[conn], "\t", lsm[conn], "\t", dpactive[conn];
		} 
}

