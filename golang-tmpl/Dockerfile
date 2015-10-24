# dockerRun: -v $(pwd):/workspace -it -e "PROJECT_NAME="$(basename $(pwd))

FROM golang:1.4-wheezy

RUN apt-get update && apt-get install -y git; \
git clone https://github.com/pote/gpm.git && cd gpm; \
git checkout v1.3.2; \
./configure; \
make install; \
mkdir /workspace

ADD Godeps /
RUN /bin/bash -c 'cd /; gpm || true';

WORKDIR /workspace
CMD \
ln -s /workspace /go/src/$PROJECT_NAME; \
/bin/bash
