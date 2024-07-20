FROM ubuntu:latest
LABEL authors="kigawa"


COPY entrypoint.sh /script/entrypoint.sh
COPY init /script/init
COPY lib /script/lib

RUN apt update \
    && apt install -y \
    openssh-server \
    sudo \
    && mkdir /run/sshd \

COPY sshd_config /etc/ssh/sshd_config
EXPOSE 22
ENV PUBKEY=""
ENV USER="kigawa"
ENV HOST_ECDSA_KEY=""
ENV HOST_ED25519_KEY=""
ENV HOST_RSA_KEY=""

ENTRYPOINT ["bash","/script/entrypoint.sh"]