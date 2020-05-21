# Use the official image as a parent image.
FROM innovanon/poobuntu-dev:latest
MAINTAINER Innovations Anonymous <InnovAnon-Inc@protonmail.com>

LABEL version="1.0"
LABEL maintainer="Innovations Anonymous <InnovAnon-Inc@protonmail.com>"
LABEL about="poobuntu-dev flavored for continuous integration"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.license="PDL (Public Domain License)"
LABEL org.label-schema.name="poobuntu-ci"
LABEL org.label-schema.url="InnovAnon-Inc.github.io/poobuntu-ci"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-type="Git"
LABEL org.label-schema.vcs-url="https://github.com/InnovAnon-Inc/poobuntu-ci"

# Run the command inside your image filesystem.
# Copy the file from your host to your current location.
COPY ci-dpkg.list .
RUN apt-fast install `cat ci-dpkg.list`

COPY gopath.sh /etc/profile.d/
RUN go get -u github.com/tcnksm/ghr

#WORKDIR /
#RUN ./ci-clean.sh

