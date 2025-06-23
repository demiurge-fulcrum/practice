#!/bin/bash

/bin/bash -c "/var/www/task/cpu/cpu_usage.sh" &

exec nginx -g "daemon off;"