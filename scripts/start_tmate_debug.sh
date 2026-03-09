#!/bin/bash

echo "Starting TMATE debug session..."

tmate -F &
sleep 10

echo "=================================="
echo "SSH Session Details:"
tmate show-messages
echo "=================================="

echo "Build paused for debugging..."

sleep 600
