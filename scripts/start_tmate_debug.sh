#!/bin/bash

echo "Starting tmate debug session..."

tmate -F | while read line; do
    echo "$line"
done
