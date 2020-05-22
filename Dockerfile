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
RUN apt-fast install `grep -ov ^[^#] ci-dpkg.list`

#COPY gopath.sh /etc/profile.d/
#RUN /bin/echo -e "`cat /etc/profile.d/gopath.sh`\n\n`cat /etc/bash.bashrc`"    > /etc/bash.bashrc
#RUN /bin/echo -e "`cat /etc/profile.d/gopath.sh`\n\n`cat /root/.bashrc`"       > /root/.bashrc
#RUN /bin/echo -e "`cat /etc/profile.d/gopath.sh`\n\n`cat /root/.bash_profile`" > /root/.bash_profile
#RUN echo "PATH=$HOME/go/bin:$PATH" >> /etc/environment

#ENV HOME=~
#ENV PATH=${HOME}/go/bin:${PATH}
ENV GOPATH=${HOME}/go
ENV PATH=${PATH}:${GOPATH}/bin

RUN go get -u github.com/tcnksm/ghr

#RUN wget -O- https://github.com/github-release/github-release/releases/download/v0.8.1/linux-amd64-github-release.bz2 \
#  | pbzip2 -d > /usr/local/bin/github-release
#RUN chmod -v +x /usr/local/bin/github-release

#WORKDIR /
#RUN ./ci-clean.sh

