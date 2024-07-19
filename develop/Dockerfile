FROM ubuntu:latest
LABEL authors="kigawa"


RUN apt update
####################################################
RUN apt install -y  openssh-server \
    && mkdir /run/sshd \
ENV PUBKEY=""
COPY sshd_config /etc/ssh/sshd_config
EXPOSE 22
####################################################

COPY entrypoint.sh /script/entrypoint.sh
RUN chmod +x /script/entrypoint.sh

ENTRYPOINT ["/script/entrypoint.sh"]