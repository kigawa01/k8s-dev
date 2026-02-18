FROM ubuntu:latest
LABEL authors="kigawa"


COPY entrypoint.sh /script/entrypoint.sh
COPY init /script/init
COPY user-init /script/user-init
COPY lib /script/lib
ADD https://go.dev/dl/go1.22.5.linux-amd64.tar.gz /usr/local/

ENV PUBKEY=""
ENV USER="kigawa"
ENV PASS="kigawa"
ENV HOST_ECDSA_KEY=""
ENV HOST_ED25519_KEY=""
ENV HOST_RSA_KEY=""
ENV CMD_INITIAL=""
ENV CMD_USER_CREATED=""
ENV CMD_USER_PREINIT=""

RUN apt update \
    && apt install -y \
        openssh-server sudo inetutils-ping rsync curl unzip git nano libgtk2.0-0t64 libgtk-3-0t64 libgbm-dev \
        libnotify-dev libnss3 libxss1 libxtst6 xauth xvfb libasound2t64 gnupg wget ca-certificates \
        podman fuse-overlayfs slirp4netns uidmap \
    && mkdir /run/sshd \
    && wget "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && sudo install -m 0755 -d /etc/apt/keyrings \
    && sudo apt update  \
    && sudo apt install -y \
      lsof clang tree ruby-full g++ make libyaml-dev \
    && tar -C /usr/local -xzf /usr/local/go1.22.5.linux-amd64.tar.gz \
    && rm /usr/local/go1.22.5.linux-amd64.tar.gz \
    && apt-get install apt-transport-https --yes \
    && apt update \
    && apt install -y postgresql-client postgresql-client-common libpq-dev mingw-w64 binutils-mingw-w64 \
        gcc-mingw-w64 g++-mingw-w64 dnsutils traceroute net-tools default-jdk \
    && chmod +x /script/entrypoint.sh \
    && curl -L -o devspace "https://github.com/loft-sh/devspace/releases/latest/download/devspace-linux-amd64" \
    && sudo install -c -m 0755 devspace /usr/local/bin

COPY sshd_config /etc/ssh/sshd_config

EXPOSE 22

ENTRYPOINT ["/script/entrypoint.sh"]
