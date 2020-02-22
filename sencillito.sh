#!/bin/bash

usage="Usage: $(basename "$0") [[-a] <store_code> <account_ref> | -s <query> | -h]

    Program for search debts using Sencillito API.
	
    -a\t\tadd account to conf file (~/.config/sencillito)
    -s <query>\tsearch for store_code
    -h\t\tshow this help text
"

mkdir -p ~/.config/sencillito

# get debt of give commerce code and accountref
function getDebt () {
	curl -si https://www.sencillito.com/utilities/$1.json?account_ref=$2 | grep -Eo "\"MONTO\",\"value\"\:\"[0-9]*\"" | grep -o "[0-9]*"
}

# -s search code of commerce
if [ "$1" = "-s" ]; then
	curl -si https://www.sencillito.com/utilities | grep -Eo "\"code\":[0-9]{4},\"title\":\"[a-zA-Z0-9_]+( [a-zA-Z0-9_\-]+)*\"" | sort -u | grep -i "$2"
	#TODO fix ticks 
	exit 0
fi

# -a add account to conf file
if [ "$1" = "-a" ]; then
	echo "$2 $3" >> ~/.config/sencillito/conf
	exit 0
fi

# -h show help info
if [ "$1" = "-h" ]; then
	printf "$usage"
	exit 0
fi

# no argument read accounts from conf file if exist
if [ $# = 0 ]; then
	if [ -e ~/.config/sencillito/conf ]; then
		while read line; do
			getDebt $line
		done < ~/.config/sencillito/conf

		exit 0
	fi
	echo Conf file not found.
	printf "$usage"
	exit 0
fi

getDebt $1 $2
