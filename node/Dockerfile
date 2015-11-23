# dockerRun: -v $(pwd):/workspace -it

FROM node:latest

ADD run.sh /

RUN \
mkdir -p /root/workspace/node_modules; \
mkdir -p /workspace; \
chmod +x /run.sh;

WORKDIR /root/workspace

CMD /run.sh
# CMD /bin/bash
