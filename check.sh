#!/bin/bash

base_url="$1"
query="$2"

url="${base_url}${query}"
echo $url

for i in $(seq 100); do
    curl -kL $url -o /dev/null -w "%{time_total}" 2>/dev/null
    echo
    sleep 1
done | awk '{s += $1} END {print s/NR}'
