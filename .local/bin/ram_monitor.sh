#!/bin/sh

total=$(free -h | awk '{ print $2 }' | head -n 2 | tail -n 1 | cut -d"G" -f1)
available=$(free -h | awk '{ print $7 }' | tail -n 2 | head -n 1 | cut -d"G" -f1)
used=$(free -h | awk '{ print $3 }' | tail -n 2 | head -n 1 | cut -d"G" -f1)

bc <<< "scale=2; (($used + 0.5)/($total + 0.5)) * 100"
sleep 2

