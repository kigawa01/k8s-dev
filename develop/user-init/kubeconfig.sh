#!/bin/bash

set -ue

echo "
apiVersion: v1
clusters:
- cluster:
    server: https://k8s.kigawa.net:6443
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: kubernetes-admin
  name: kubernetes-admin@kubernetes
current-context: kubernetes-admin@kubernetes
kind: Config
preferences: {}
users:
- name: kubernetes-admin
  user:
"

