FROM ubuntu:latest
LABEL authors="kigawa"


COPY entrypoint.sh /script/entrypoint.sh
COPY init /script/init
COPY user-init /script/user-init
COPY lib /script/lib

RUN apt update \
    && apt install -y \
    openssh-server \
    sudo \
    inetutils-ping \
    rsync \
    curl \
    unzip \
    git \
    nano \
    libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libnss3 libxss1 libxtst6 xauth xvfb \
    && mkdir /run/sshd

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