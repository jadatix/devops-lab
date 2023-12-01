#!/bin/bash

log_file="/var/log/my-app.log"
redis_key="lab_key"

if [ -f "$log_file" ] && [ -e "$log_file" ]; then
    current_size=$(stat -c%s "$log_file")
    current_date=$(stat -c%Y "$log_file")

    last_size=$(docker exec redis_tmp redis-cli hget "$redis_key" size 2>/dev/null)
    last_date=$(docker exec redis_tmp redis-cli hget "$redis_key" date 2>/dev/null)

    if [ "$current_size" -ne "$last_size" ] || [ "$current_date" -ne "$last_date" ]; then
        docker exec redis_tmp redis-cli hmset "$redis_key" size "$current_size" date "$current_date"
        echo "Log file has changed. Recorded new information in Redis."
    else
        echo "Log file has not changed."
    fi
else
    echo "Log file  does not exist."
fi
