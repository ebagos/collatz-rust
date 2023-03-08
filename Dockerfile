FROM rust:1.67-alpine3.17 AS Builder

RUN apk add protoc protobuf-dev musl-dev

WORKDIR /src
COPY ./ /src

RUN cargo build --release

FROM alpine:3.17
WORKDIR /app
COPY --from=Builder /src/target/release/collatz-rust /app/collatz-rust
ENTRYPOINT ["/app/collatz-rust"]
EXPOSE 50051
