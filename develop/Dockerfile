FROM ubuntu:latest
LABEL authors="kigawa"


COPY entrypoint.sh /script/entrypoint.sh
RUN apt update

####################################################
RUN apt install -y  openssh-server \
    && mkdir /run/sshd
ENV PUBKEY=""
COPY sshd_config /etc/ssh/sshd_config
EXPOSE 22
####################################################

COPY init /script/init

ENTRYPOINT ["bash","/script/entrypoint.sh"]