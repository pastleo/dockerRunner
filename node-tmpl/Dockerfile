# dockerRun: -v $(pwd):/workspace -it

FROM node:latest

RUN \
mkdir -p /root/workspace; \
mkdir -p /workspace;

# Add global (cli) packages to install on demand, ex:
# RUN npm install -g sails

ADD package.json /root/workspace/

WORKDIR /root/workspace

RUN npm install

# CMD commands
# ================
# for f in $(ls /workspace/); do
#     if ! [ -e $f ]; then
#         ln -s /workspace/$f /root/workspace/$f;
#     fi;
# done;

CMD bash -c 'for f in $(ls /workspace/); do if ! [ -e $f ]; then ln -s /workspace/$f /root/workspace/$f; fi; done;'; bash;
