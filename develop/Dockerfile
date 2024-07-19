FROM ubuntu:latest
LABEL authors="kigawa"


RUN apt update
####################################################
RUN apt install -y  openssh-server \
    && mkdir /run/sshd \
ENV PUBKEY=""
####################################################

EXPOSE 22

COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint.sh /script/entrypoint.sh

ENTRYPOINT ["/script/entrypoint.sh"]