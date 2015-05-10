FROM debian:wheezy
MAINTAINER Gordon Stratton <gordon.stratton@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get -q update
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install curl libffi5

RUN curl -Ls https://technomancy.github.io/grenchman/downloads/grench-0.2.0-debian-7 \
  > /usr/local/bin/grench \
  && chmod +x /usr/local/bin/grench

RUN curl -Ls https://technomancy.github.io/grenchman/downloads/grench-0.2.0-debian-7.sha1 \
  | sha1sum /usr/local/bin/grench

ENTRYPOINT ["/usr/local/bin/grench"]
