# dockerRun: -v $(pwd):/workspace -it -e "PROJECT_NAME="$(basename $(pwd))

FROM golang:1.4-wheezy
ADD run.sh /

RUN apt-get update && apt-get install -y git; \
git clone https://github.com/pote/gpm.git && cd gpm; \
git checkout v1.3.2; \
./configure; \
make install; \
mkdir /workspace; \
ln -s /workspace /go/src/workspace; \
chmod u+x /run.sh;

WORKDIR /workspace

# CMD /bin/bash
CMD /run.sh
