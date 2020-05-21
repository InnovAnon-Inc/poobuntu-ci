RUN apt-fast purge `cat ci-dpkg.list`
RUN ./dev-poobuntu.sh
RUN rm -v ci-dpkg.list

