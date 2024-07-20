#!/bin/bash

adduser --disabled-password --gecos "" "$USER"
echo "${USER}:${PASS}" | chpasswd