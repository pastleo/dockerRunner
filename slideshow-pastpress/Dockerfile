# dockerRun: -it -v $(cd /c/Users/ 2> /dev/null || cd /Users/ 2> /dev/null; pwd)":"$(cd /c/Users/ 2> /dev/null || cd /Users/ 2> /dev/null; pwd) -v $(pwd):/workspace

FROM debian:jessie

RUN apt-get update && apt-get install -y \
  git \
  wget \
  unzip \
  vim \
  man \
  locales
RUN apt-get clean

# Use UTF8
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && /usr/sbin/locale-gen

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get -y install ruby

RUN gem install slideshow

RUN git clone https://github.com/chgu82837/PastPress.git ~/.slideshow/templates/pastpress

RUN mkdir /workspace
WORKDIR /workspace

CMD /bin/bash
