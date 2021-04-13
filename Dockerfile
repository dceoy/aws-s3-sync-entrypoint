FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

ADD https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip /tmp/awscli.zip
ADD s3-sync-entrypoint /usr/local/bin/s3-sync-entrypoint

RUN set -e \
      && ln -sf bash /bin/sh

RUN set -e \
      && apt-get -y update \
      && apt-get -y dist-upgrade \
      && apt-get -y install --no-install-recommends --no-install-suggests \
        unzip \
      && apt-get -y autoremove \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN set -e \
      && cd /tmp \
      && unzip awscli.zip \
      && ./aws/install

ENV LOCAL_INPUT_DIR /input
ENV LOCAL_OUTPUT_DIR /output

RUN set -e \
      && mkdir "${LOCAL_INPUT_DIR}" "${LOCAL_OUTPUT_DIR}" \
      && chmod +x /usr/local/bin/s3-sync-entrypoint

ENTRYPOINT ["/usr/local/bin/s3-sync-entrypoint"]
