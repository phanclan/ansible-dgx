#!/usr/bin/env bash

if [ ! -f /root/.ansible_bootstrap ] ; then
  apt-get update
  apt-get -y install python
  touch /root/.ansible_bootstrap
  echo "DONE"
fi
