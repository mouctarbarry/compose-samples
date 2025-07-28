FROM jenkins/agent:latest-jdk17

USER root

# Installer AWS CLI et Python
RUN apt-get update && \
    apt-get install -y curl unzip python3 python3-pip python3-venv && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws && \
    python3 --version && pip3 --version

USER jenkins
