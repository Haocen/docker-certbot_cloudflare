# Use official certbot image
FROM certbot/certbot

LABEL ORIGINAL_SOURCE="https://github.com/horjulf/docker-certbot_cloudflare/blob/master/Dockerfile"
LABEL org.opencontainers.image.source="https://github.com/Haocen/docker-certbot_cloudflare"

# Install dependencies and plugin
RUN apk --no-cache -U upgrade && \
    apk --no-cache -U add --virtual .build-deps \
      gcc \
      linux-headers \
      openssl-dev \
      musl-dev \
      libffi-dev && \
    pip --no-cache-dir install -U pip setuptools && \
    pip --no-cache-dir install -U certbot-dns-cloudflare && \
    apk --no-cache del .build-deps
