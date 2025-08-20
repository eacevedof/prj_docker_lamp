FROM ubuntu:22.04

USER root

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    -y jq vim wget unzip ca-certificates cron procps moreutils bsdmainutils build-essential git

RUN apt-get install -y --no-install-recommends \
       libicu-dev \
       zlib1g-dev \
       libpng-dev \
       libzip-dev \
       unzip \
       git \
       curl \
       lftp

RUN curl -fsSL https://deno.land/install.sh | sh

ENV DENO_INSTALL="/root/.deno"
ENV PATH="$DENO_INSTALL/bin:$PATH"

RUN deno --version

RUN mv /root/.bashrc /root/.bashrc.bak
COPY ./.bashrc /root/.bashrc
RUN sed -i 's/\r$//' /root/.bashrc

echo "deno installed successfully. Starting deno app"
CMD ["bash", "/www/start-deno-app.sh"]
#CMD ["tail", "-f", "/dev/null"]