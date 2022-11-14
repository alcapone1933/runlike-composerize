FROM alpine:latest
LABEL maintainer="alcapone1933 <alcapone1933@cosanostra-cloud.de>" \
      org.opencontainers.image.created="$(date +%Y-%m-%d\ %H:%M)" \
      org.opencontainers.image.authors="alcapone1933 <alcapone1933@cosanostra-cloud.de>" \
      org.opencontainers.image.url="https://hub.docker.com/r/alcapone1933/runlike-composerize" \
      org.opencontainers.image.version="latest" \
      org.opencontainers.image.ref.name="alcapone1933/runlike-composerize" \
      org.opencontainers.image.title="runlike-composerize" \
      org.opencontainers.image.description="Runlike and Composerize:  Output containers to docker-compose"

RUN apk add --update --no-cache python3 curl docker npm && \
    rm -rf /var/cache/apk/* && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    pip install runlike && \
    npm install composerize -g
# ENTRYPOINT ["composerize"]
# ENTRYPOINT ["runlike"]
