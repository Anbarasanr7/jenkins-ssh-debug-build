# Jenkins SSH Debug Build

This project demonstrates how to implement a **"Rebuild with SSH"** feature in Jenkins similar to CircleCI.

## Features

- Jenkins pipeline
- Docker-based builds
- Optional SSH debug sessions
- tmate remote debugging
- Python test example

## Architecture

Developer → Jenkins → Docker Container → SSH Debug Session

## Run

1. Create Jenkins pipeline
2. Enable parameter `ENABLE_DEBUG`
3. Run build
4. SSH session will appear in logs
