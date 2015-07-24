# dockerRun: -v $(pwd):/workspace -p 80:3000 -it

FROM rails:latest

ADD run.sh /
RUN mkdir -p /workspace; chmod u+x /run.sh
WORKDIR /workspace

CMD /run.sh
# CMD /bin/bash
