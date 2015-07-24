# dockerRun: -it -v $(pwd):/workspace

FROM python:2

ADD requirements.txt /
RUN pip install -r /requirements.txt

RUN mkdir /workspace
WORKDIR /workspace

CMD /bin/bash
