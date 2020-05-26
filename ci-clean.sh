#! /usr/bin/env bash
set -exu

apt-fast purge `grep -v '^[\^#]' ci-dpkg.list`
./dev-poobuntu.sh
rm -v ci-dpkg.list

