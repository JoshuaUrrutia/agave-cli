#!/bin/bash
#
# json-mirror.sh
#
# author: dooley@tacc.utexas.edu
#
# Bash client to the Agave json-mirror api.
# @see https://bitbucket.org/taccaci/agave-json-mirror
#
response=$(echo "${1}" | curl -s --globoff -X POST -H "Content-Type: application/json" --data-binary @- "http://agaveapi.co/json-mirror?q=${2}")

if [[ -n "$3" ]]; then
    echo "${response}" | sed 's/^[ \t]*//g' | sed 's/\"//g'
else
    echo "${response}" | sed 's/^\s+\"/"/g' | sed 's/\[//g' | sed 's/\]//g' | sed 's/\"//g' | sed 's/,$//g' | sed 's/  //g'
fi
