#!/bin/bash

echo "Starting SSH server..."

useradd -m debuguser
mkdir -p /home/debuguser/.ssh

echo "$DEBUG_PUBLIC_KEY" > /home/debuguser/.ssh/authorized_keys

chmod 600 /home/debuguser/.ssh/authorized_keys
chown -R debuguser:debuguser /home/debuguser/.ssh

/usr/sbin/sshd

IP=$(hostname -i)

echo "=================================="
echo "SSH into container using:"
echo "ssh debuguser@$IP"
echo "=================================="

sleep 600
