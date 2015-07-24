# dockerRun: -it -v $(pwd):/workspace

FROM python:2

ADD run.sh /
RUN mkdir -p /workspace; chmod u+x /run.sh
WORKDIR /workspace

CMD /run.sh
# CMD /bin/bash
