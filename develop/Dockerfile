FROM ubuntu:latest
LABEL authors="kigawa"

ENV PUBKEY=""

RUN apt update && \
    apt install -y \
    openssh-server \
    && \
    mkdir /run/sshd

EXPOSE 22

COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint.sh /script/entrypoint.sh

ENTRYPOINT ["/script/entrypoint.sh"]