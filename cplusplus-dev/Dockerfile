# dockerRun: -it -v $(cd /c/Users/ 2> /dev/null || cd /Users/ 2> /dev/null; pwd)":"$(cd /c/Users/ 2> /dev/null || cd /Users/ 2> /dev/null; pwd) -v $(pwd):/workspace

FROM debian:jessie

RUN apt-get update && apt-get install -y \
  git \
  wget \
  unzip \
  vim \
  man
RUN apt-get clean

RUN apt-get -y install g++

RUN mkdir /workspace
WORKDIR /workspace

CMD /bin/bash
