# dockerRun: -it -v $(pwd):/workspace

FROM debian

RUN apt-get update 
RUN apt-get install -y \
  git \
  wget \
  unzip \
  vim \
  man
RUN apt-get clean

RUN mkdir /workspace
WORKDIR /workspace

CMD /bin/bash
