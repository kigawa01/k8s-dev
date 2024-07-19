FROM ubuntu:latest
LABEL authors="kigawa"


COPY entrypoint.sh /script/entrypoint.sh
RUN apt update

####################################################
RUN apt install -y  openssh-server \
    && mkdir /run/sshd
ENV PUBKEY=""
ENV USER="kigawa"
COPY sshd_config /etc/ssh/sshd_config
EXPOSE 22
####################################################

COPY init /script/init
COPY lib /script/lib

ENTRYPOINT ["bash","/script/entrypoint.sh"]