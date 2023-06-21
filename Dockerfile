FROM alpine:latest

USER root

RUN apk --no-cache add bash

WORKDIR /app

COPY src/ .
RUN chmod +x /app/*.sh

COPY test/ /test

USER 1001
