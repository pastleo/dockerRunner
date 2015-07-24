# dockerRun: -it -v $(pwd):/workspace

FROM python:3

ADD requirements.txt /
RUN pip install -r /requirements.txt

RUN mkdir /workspace
WORKDIR /workspace

CMD /bin/bash
