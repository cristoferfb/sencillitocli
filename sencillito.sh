#!/bin/bash

mkdir -p ~/.config/sencillito

if [ "$1" = "-s" ]; then
	curl -si https://www.sencillito.com/utilities | grep -Eo "\"code\":[0-9]{4},\"title\":\"[a-zA-Z0-9_]+( [a-zA-Z0-9_\-]+)*\"" | sort -u | grep -i "$2"
	#TODO fix ticks 
	exit 0
fi

if [ "$1" = "-a" ]; then
	echo "$2 $3" >> ~/.config/sencillito/conf
	exit 0
fi

function getDebt () {
	curl -si https://www.sencillito.com/utilities/$1.json?account_ref=$2 | grep -Eo "\"MONTO\",\"value\"\:\"[0-9]*\"" | grep -o "[0-9]*"
}

getDebt $1 $2
