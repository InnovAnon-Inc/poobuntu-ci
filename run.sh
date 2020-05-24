#! /bin/bash
set -exu
[[ $# -eq 0 -o $# -eq 1 ]]

command -v docker ||
curl https://raw.githubusercontent.com/InnovAnon-Inc/repo/master/get-docker.sh | bash

if [ -z ${1+x} ] ; then
	CMD='docker build -t innovanon/poobuntu-ci .'
	PUSH='docker push innovanon/poobuntu-ci:latest'
else
	#CMD="docker build -t innovanon/poobuntu-ci-$1 --build-arg DOCKER_TAG=$1 ."
	CMD="docker build -t innovanon/poobuntu-ci-$1 --build-arg VERSION=$1 ."
	PUSH="docker push innovanon/poobuntu-ci-$1:latest"
fi

sudo             -- \
nice -n +20      -- \
sudo -u `whoami` -- \
$CMD

$PUSH || :

