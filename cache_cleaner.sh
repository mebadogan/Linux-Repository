#!/usr/bin/bash

total_memory=$(grep MemTotal /proc/meminfo | awk '{print $2}')
free_memory=$(grep MemFree /proc/meminfo | awk '{print $2}')
used_memory=$((total_memory - free_memory))
threshold=$((total_memory / 100 * 11))

if [ "$free_memory" -lt "$threshold" ]; then
    sync; echo 3 > /proc/sys/vm/drop_caches
fi