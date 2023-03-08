FROM rust:1.67-alpine3.17

RUN apk add protoc protobuf-dev

WORKDIR /src
COPY ./ /src

RUN cargo build

