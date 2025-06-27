#!/bin/bash

URL="https://www.youtube.com/"

while true; do

    status=$(curl -s -I "$URL" | grep HTTP | awk '{print $2}' | grep -E "2\d\d")
    tcp_status=$(nc -zv www.youtube.com 443 2>&1 | grep -o succeeded)
    if [ ! -z "$status" ]; then
        log=$(date '+%d/%b/%Y:%H:%M:%S')
        log+=" $URL доступен по http, получен статус код $status"
        echo "$log" >> /logs/access.log
    fi

    if [ ! -z "$tcp_status" ]; then
        log_tcp=$(date '+%d/%b/%Y:%H:%M:%S')
        log_tcp+=" $URL доступен по tcp, получен статус код $tcp_status"
        echo "$log_tcp" >> /logs/access.log
    fi
    sleep 10
done