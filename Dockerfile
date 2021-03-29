ARG ALPINE_VERSION=3.13

FROM alpine:${ALPINE_VERSION}

ENV BACKUP_FOLDER /opt/mysql/backup

RUN apk add --update --no-cache mysql-client>=10.5.8 \
 && mkdir -p ${BACKUP_FOLDER}

COPY ./scripts/daily/* /etc/periodic/daily
RUN chmod a+x /etc/periodic/daily/*

CMD [ "crond", "-f", "-d", "8" ]
