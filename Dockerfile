FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    openssh-server \
    curl \
    git \
    tmate \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd

WORKDIR /app

COPY app/ /app

CMD ["python", "main.py"]
