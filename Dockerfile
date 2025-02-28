FROM alpine:3

LABEL org.opencontainers.image.source https://github.com/mkilchhofer/logrotate-container
LABEL org.opencontainers.image.source https://github.com/ARANOVA/logrotate-container

ARG USER=distroless
ARG USERID=65532
ARG GROUP=distroless
ARG GROUPID=65532

RUN apk --update add --no-cache logrotate && \
    rm -f /etc/logrotate.d/*
ADD logrotate.conf /etc/logrotate.conf
RUN chmod 0400 /etc/logrotate.conf

RUN addgroup -g $GROUPID -S $GROUP \
    && adduser -D -u $USERID -H -S -s /sbin/nologin $USER $GROUP

CMD ["/usr/sbin/logrotate", "-v", "-f", "--state","/tmp/logrotate.status", "/etc/logrotate.conf"]
