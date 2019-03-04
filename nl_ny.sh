#!/bin/sh
rad=1
while read line
do
	echo "$rad $line"
	rad=$((rad + 1))
done

