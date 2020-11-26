FROM alpine:3.12.1

RUN apk add --no-cache bash=5.0.17-r0 gettext=0.20.2-r0

ENV REVISION=${REVISION}

ARG NAME
ARG DESCRIPTION
ARG VERSION
ARG COMMIT_SHA
ARG BUILD_TIMESTAMP
ARG VCS_URL

LABEL org.opencontainers.image.title="$NAME"
LABEL org.opencontainers.image.description="$DESCRIPTION"
LABEL org.opencontainers.image.version="$VERSION"
LABEL org.opencontainers.image.created="$BUILD_TIMESTAMP"
LABEL org.opencontainers.image.revision="$COMMIT_SHA"
LABEL org.opencontainers.image.source="$VCS_URL"
LABEL org.opencontainers.image.author="Koenighotze"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.docker.cmd="docker run --rm=true -ti koenighotze/${NAME}"

COPY render.sh /home/render/render.sh

ENTRYPOINT ["/home/render/render.sh"]