FROM v2fly/v2fly-core:v4.45.2

# RUN yum update -y
RUN apk add --no-cache nginx bash \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /data

COPY conf /conf
COPY ./www /data/www

COPY run.sh /run.sh
RUN chmod 744 /run.sh

EXPOSE 80

ENTRYPOINT "/run.sh"
