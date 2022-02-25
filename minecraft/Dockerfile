FROM alpine:3.15

ARG VANILLA_VERSION

WORKDIR /server

COPY setup_server.sh .

RUN chmod +x setup_server.sh
RUN ./setup_server.sh
RUN ls