#!/bin/bash
export NUM=$(egrep -v "^@" $1 | wc -l | awk '{print $1}')

egrep -v "^@" $1 \
	| cut -f2 \
	| awk '$1==4{print "unmapped"}$1!=4{print "mapped"}' \
	| sort \
	| uniq -c \
	| awk -v N=$NUM '{print $2"\t"100*$1/N}'

