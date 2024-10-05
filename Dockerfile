FROM node:18-alpine3.20
LABEL maintainer="alcapone1933 <alcapone1933@cosanostra-cloud.de>" \
      org.opencontainers.image.created="$(date +%Y-%m-%d\ %H:%M)" \
      org.opencontainers.image.authors="alcapone1933 <alcapone1933@cosanostra-cloud.de>" \
      org.opencontainers.image.url="https://hub.docker.com/r/alcapone1933/runlike-composerize" \
      org.opencontainers.image.version="latest" \
      org.opencontainers.image.ref.name="alcapone1933/runlike-composerize" \
      org.opencontainers.image.title="runlike-composerize" \
      org.opencontainers.image.description="Runlike and Composerize:  Output containers to docker-compose"

RUN apk add --update --no-cache python3 py3-pip curl docker npm && \
    rm -rf /var/cache/apk/* && \
    pip3 install --break-system-packages runlike && \
    npm install composerize -g

# ENTRYPOINT ["composerize"]
# ENTRYPOINT ["runlike"]
