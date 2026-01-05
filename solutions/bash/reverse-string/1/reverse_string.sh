#!/usr/bin/env bash

str=$1
reversed=""
len=${#str}

# for loop length len put first char at end of reversedstring
for ((c=0 ; c < len ; c++ )); do
	#echo "$reversed"
	reversed="${str:$c:1}$reversed"
	#echo "$reversed"
done

echo "$reversed"