FROM ubuntu:22.04

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    -y jq vim wget unzip ca-certificates cron procps moreutils build-essential

RUN apt-get install -y --no-install-recommends \
       libicu-dev \
       zlib1g-dev \
       libpng-dev \
       libzip-dev \
       unzip \
       git \
       curl

RUN curl -fsSL https://deno.land/install.sh | sh

ENV DENO_INSTALL="/root/.deno"
ENV PATH="$DENO_INSTALL/bin:$PATH"

# Verify installation
RUN deno --version

# Default command (optional)
CMD ["deno", "repl"]
CMD ["tail", "-f", "/dev/null"]

RUN mv /root/.bashrc /root/.bashrc.bak
COPY ./.bashrc /root/.bashrc
RUN sed -i 's/\r$//' /root/.bashrc