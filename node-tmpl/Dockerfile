# dockerRun: -v $(pwd):/workspace -it

FROM node:latest

WORKDIR /
ADD package.json /
RUN npm install -g; mkdir -p /workspace;

WORKDIR /workspace

CMD /bin/bash
