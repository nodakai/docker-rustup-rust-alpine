FROM alpine:edge
MAINTAINER NODA, Kai <nodakai@gmail.com>

ENV RUSTUP_TOOLCHAIN=stable-x86_64-unknown-linux-musl

RUN echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk add --no-cache cargo@testing rust@testing \
        curl ca-certificates gcc musl-dev make zlib-dev openssl-dev perl git

WORKDIR /root

RUN git clone https://github.com/rust-lang-nursery/rustup.rs.git && cd rustup.rs && cargo build --release && mv target/release/rustup-init /tmp

CMD ["/bin/true"]
