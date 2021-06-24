#!/usr/bin/env bash
disk_size=$1
#|human_to_bytes
lvm_size=$3
#|human_to_bytes

if (( $(echo "$lvm_size != $disk_size" |bc -l) )); then
  echo "less"
fi 