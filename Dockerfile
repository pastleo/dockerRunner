# dockerRun: -it -v $(cd /c/Users/ 2> /dev/null || cd /Users/ 2> /dev/null; pwd)":"$(cd /c/Users/ 2> /dev/null || cd /Users/ 2> /dev/null; pwd) -v /var/run/docker.sock:/var/run/docker.sock

FROM debian:jessie

RUN apt-get update
RUN apt-get install -y \
  docker.io \
  git \
  wget \
  unzip \
  vim \
  docker \
  man
RUN apt-get clean

RUN mkdir /dockeR
ADD ./ /dockeR/
RUN /bin/sh /dockeR/dockeR --install

CMD /bin/bash
