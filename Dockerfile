FROM alpine:3

LABEL org.opencontainers.image.source https://github.com/mkilchhofer/logrotate-container
LABEL org.opencontainers.image.source https://github.com/ARANOVA/logrotate-container

RUN apk --update add --no-cache logrotate && \
    rm -f /etc/logrotate.d/*
ADD logrotate.conf /etc/logrotate.conf
RUN chmod 0400 /etc/logrotate.conf

CMD ["/usr/sbin/logrotate", "-v", "-f", "--state","/tmp/logrotate.status", "/etc/logrotate.conf"]
