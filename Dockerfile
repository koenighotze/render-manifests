FROM alpine:3.9

RUN apk add --no-cache bash gettext

ARG NAME=n/a
ARG SOURCE=n/a
ARG REVISION=n/a

ENV REVISION=${REVISION}

LABEL org.opencontainers.image.source="${SOURCE}"
LABEL org.opencontainers.image.revision="${REVISION}"

COPY render.sh /home/render/render.sh

ENTRYPOINT ["/home/render/render.sh"]