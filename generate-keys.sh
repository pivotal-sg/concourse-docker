#!/usr/bin/env bash

set -e -u -x

mkdir -p keys/web keys/worker

yes | ssh-keygen -t rsa -f ./keys/web/tsa_host_key -N ''
yes | ssh-keygen -t rsa -f ./keys/web/session_signing_key -N ''

yes | ssh-keygen -t rsa -f ./keys/worker/worker_key -N ''
yes | ssh-keygen -t rsa -f ./windows-worker/worker_key -N ''

cat ./keys/worker/worker_key.pub ./windows-worker/worker_key.pub > ./keys/web/authorized_worker_keys
cp ./keys/web/tsa_host_key.pub ./keys/worker
cp ./keys/web/tsa_host_key.pub ./windows-worker
