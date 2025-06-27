FROM alpine:3.20

COPY check.sh /app/check.sh

RUN apk add --no-cache bash curl netcat-openbsd && \
    chmod +x /app/check.sh
    
VOLUME ["/app"]

EXPOSE 80 443

CMD ["/app/check.sh"]