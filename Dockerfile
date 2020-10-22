FROM rust:1.47 as builder
WORKDIR /usr/src/gha1
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
COPY --from=builder /usr/local/cargo/bin/gha1 /usr/local/bin/gha1
CMD ["gha1"]
