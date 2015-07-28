# dockerRun: -v $(pwd):/workspace -p 80:3000 -it

FROM rails:latest

WORKDIR /
ADD Gemfile /
RUN bundle; mkdir -p /workspace; /bin/bash -c "echo \"alias s='rails s -b 0.0.0.0'\" > /root/.rs";

WORKDIR /workspace

CMD \
/bin/echo "=== Rails Environment ======================================="; \
/bin/echo "Use 'rails new ./' to init the rails project in this folder"; \
/bin/echo "Or use 's' (alias of 'rails s -b 0.0.0.0') to start the development server"; \
/bin/bash --rcfile /root/.rs
