# dockerRun: -v $(pwd):/workspace -p 80:3000 -it

FROM rails:latest

WORKDIR /
ADD Gemfile /
RUN bundle; mkdir -p /workspace;

WORKDIR /workspace

CMD /bin/bash
