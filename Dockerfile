FROM alpine:latest

USER root

RUN apk --no-cache add bash && adduser -D test

WORKDIR /app

COPY src/ .
RUN chmod +x /app/*.sh

COPY test/ /test

RUN cp /app/script5.sh /test/ && chown -R test:test /test

USER test
