#!/bin/bash

# simple script to start SOCKS proxy tunnel to a given regional bastion host

proxyhost=$1

echo "hit Ctrl-C to close the tunnel."

ssh -N -D 0.0.0.0:1337 mike.carlson@$proxyhost
