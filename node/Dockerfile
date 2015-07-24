# dockerRun: -v $(pwd):/workspace -it

FROM node:latest

ADD run.sh /
RUN mkdir -p /workspace; chmod u+x /run.sh
WORKDIR /workspace

CMD /run.sh
# CMD /bin/bash
