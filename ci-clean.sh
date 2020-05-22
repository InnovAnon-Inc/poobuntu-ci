RUN apt-fast purge `grep -v '^[\^#]' ci-dpkg.list`
RUN ./dev-poobuntu.sh
RUN rm -v ci-dpkg.list

