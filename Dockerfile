# dockerRun: -it -v $(cd /c/Users/ 2> /dev/null || cd /Users/ 2> /dev/null; pwd)":"$(cd /c/Users/ 2> /dev/null || cd /Users/ 2> /dev/null; pwd) -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/workspace

FROM debian:jessie

RUN apt-get update
RUN apt-get install -y \
  git \
  wget \
  unzip \
  vim \
  man \
  curl
RUN apt-get clean

RUN curl -sSL https://get.docker.com/ | sh

RUN mkdir -p /dockeRun

ADD . /dockeRun

RUN sh /dockeRun/dockeRun --install

RUN mkdir -p /workspace
WORKDIR /workspace

CMD /bin/bash
