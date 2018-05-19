FROM ubuntu:18.04
LABEL maintainer="Williams Medina <williams.medinaa@gmail.com>"

COPY scripts /root/scripts

# Install node
ENV NODE_VERSION=10.1.0
RUN /bin/bash /root/scripts/install.sh

# Run node
CMD [ "node" ]