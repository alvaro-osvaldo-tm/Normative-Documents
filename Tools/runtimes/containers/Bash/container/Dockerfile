# Production container
FROM debian:12.6-slim AS production


## Define metadata
LABEL org.opencontainers.image.authors="Álvaro Osvaldo (alvaro@osvaldo.dev.br)"
LABEL org.opencontainers.image.ref.name="bash development environment"
LABEL org.opencontainers.image.title="Environment to run bash scrips"
LABEL org.opencontainers.image.description ="Run safety a bash script into an isolated environment."

## Configure runtime
ENV APP_ENV production

RUN usermod -d /app nobody

USER nobody

## Configure entrypoint
WORKDIR /app
ENTRYPOINT [ "/bin/bash" ] 
CMD ["/app/main.sh"]
HEALTHCHECK NONE

## Configure next-build
ONBUILD USER root


# Development container
FROM  production as development

## Define metadata
LABEL org.opencontainers.image.description ="Better safety support for bash scripts development into an isolated environment."

## Configure runtime
ENV APP_ENV development

## Install dependencies
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y entr bats bats-assert bats-file bats-support

## Copy install scripts
COPY install /src/install

## Execute install scripts    
RUN  /src/install/development/bashdb.sh 

## Clean up
RUN rm -Rfv /src/install \
    && apt-get clean 
    
## Configure runtime
USER nobody