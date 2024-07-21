FROM ubuntu:latest
LABEL authors="kigawa"


COPY entrypoint.sh /script/entrypoint.sh
COPY init /script/init
COPY lib /script/lib

RUN apt update \
    && apt install -y \
    openssh-server \
    sudo \
    inetutils-ping \
    rsync \
    && mkdir /run/sshd \
    && curl -fsSL https://fnm.vercel.app/install | bash

COPY sshd_config /etc/ssh/sshd_config

EXPOSE 22

ENV PUBKEY=""
ENV USER="kigawa"
ENV PASS="kigawa"
ENV HOST_ECDSA_KEY=""
ENV HOST_ED25519_KEY=""
ENV HOST_RSA_KEY=""
ENV CMD_INITIAL=""
ENV CMD_USER_CREATED=""

ENTRYPOINT ["bash","/script/entrypoint.sh"]