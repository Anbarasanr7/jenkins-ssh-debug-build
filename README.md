# Jenkins SSH Debug Build

This project demonstrates how developers can SSH into a running Jenkins Docker build for debugging.

## Debug Modes

1. NONE
Normal pipeline execution.

2. TMATE
Creates temporary SSH session.

3. DIRECT_SSHD
Starts SSH server inside container.

## Trigger Build

From Jenkins UI select parameter:

DEBUG_MODE=TMATE

Console log will show:

ssh session@nyc1.tmate.io -p <port>

Connect using your terminal.

## Use Case

Allows developers to debug CI builds interactively.
