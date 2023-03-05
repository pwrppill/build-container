FROM ubuntu:latest

# Install packages
RUN apt update && apt install maven openjdk-8-jre docker.io git openssh-client -y

# Confugure ssh client
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
