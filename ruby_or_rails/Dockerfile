# dockerRun: -v $(pwd):/workspace -p 80:3000 -it

FROM rails:latest

ADD run.sh /

# ## == .bashrc for rails ==
#
# function stop()
# {
#     if [[ -f tmp/pids/server.pid ]]; then
#         echo "Stopping server ..."
#         kill $(cat tmp/pids/server.pid)
#         sleep 5; rm -f tmp/pids/server.pid;
#         return 0
#     else
#         return 1
#     fi
# }
#
# function s()
# {
#     stop || rails s -b 0.0.0.0 &> /var/log/rs.log &
# }
#
# function l()
# {
#     less +F /var/log/rs.log
# }
#
# function _exit()
# {
#     stop
# }
# trap _exit EXIT

RUN apt-get update && apt-get install -y less; \
mkdir -p /workspace; chmod u+x /run.sh; \
/bin/bash -c "echo ' ## == .bashrc for rails == ' >> /root/.bashrc"; \
/bin/bash -c "echo ' ' >> /root/.bashrc"; \
/bin/bash -c "echo ' function stop() ' >> /root/.bashrc"; \
/bin/bash -c "echo ' { ' >> /root/.bashrc"; \
/bin/bash -c "echo '     if [[ -f tmp/pids/server.pid ]]; then ' >> /root/.bashrc"; \
/bin/bash -c "echo '         echo \"Stopping server ...\" ' >> /root/.bashrc"; \
/bin/bash -c "echo '         kill \$(cat tmp/pids/server.pid) ' >> /root/.bashrc"; \
/bin/bash -c "echo '         sleep 5; rm -f tmp/pids/server.pid; ' >> /root/.bashrc"; \
/bin/bash -c "echo '         return 0 ' >> /root/.bashrc"; \
/bin/bash -c "echo '     else ' >> /root/.bashrc"; \
/bin/bash -c "echo '         return 1 ' >> /root/.bashrc"; \
/bin/bash -c "echo '     fi ' >> /root/.bashrc"; \
/bin/bash -c "echo ' } ' >> /root/.bashrc"; \
/bin/bash -c "echo ' ' >> /root/.bashrc"; \
/bin/bash -c "echo ' function s() ' >> /root/.bashrc"; \
/bin/bash -c "echo ' { ' >> /root/.bashrc"; \
/bin/bash -c "echo '     stop || rails s -b 0.0.0.0 &> /var/log/rs.log & ' >> /root/.bashrc"; \
/bin/bash -c "echo ' } ' >> /root/.bashrc"; \
/bin/bash -c "echo ' ' >> /root/.bashrc"; \
/bin/bash -c "echo ' function l() ' >> /root/.bashrc"; \
/bin/bash -c "echo ' { ' >> /root/.bashrc"; \
/bin/bash -c "echo '     less +F /var/log/rs.log ' >> /root/.bashrc"; \
/bin/bash -c "echo ' } ' >> /root/.bashrc"; \
/bin/bash -c "echo ' ' >> /root/.bashrc"; \
/bin/bash -c "echo ' function _exit() ' >> /root/.bashrc"; \
/bin/bash -c "echo ' { ' >> /root/.bashrc"; \
/bin/bash -c "echo '     stop ' >> /root/.bashrc"; \
/bin/bash -c "echo ' } ' >> /root/.bashrc"; \
/bin/bash -c "echo ' trap _exit EXIT ' >> /root/.bashrc"; \
/bin/bash -c "echo ' ' >> /root/.bashrc";

WORKDIR /workspace

CMD /run.sh
# CMD /bin/bash
