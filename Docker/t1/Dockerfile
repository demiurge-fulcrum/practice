FROM alpine:3.20

COPY ./var/ /var/
COPY ./conf_d/* /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/nginx.conf
COPY ./bin/startup.sh /startup.sh

RUN apk update && apk add --no-cache nginx \
    bash \
    procps \
    nginx-mod-http-image-filter \
    grep \
    bc && \
    chmod +x /startup.sh /var/www/task/cpu/cpu_usage.sh && \
    chown -R nginx:nginx /var/www/ && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /var/run/ && \
    rm -f /var/log/nginx/access.log /var/log/nginx/error.log && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log
    

USER nginx

ENTRYPOINT ["/startup.sh"]