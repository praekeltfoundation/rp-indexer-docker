FROM debian:bullseye-slim as build

ARG INDEXER_REPO
ARG INDEXER_VERSION

RUN apt update && apt install -y wget
RUN wget -q -O indexer.tar.gz "https://github.com/$INDEXER_REPO/releases/download/v${INDEXER_VERSION}/rp-indexer_${INDEXER_VERSION}_linux_amd64.tar.gz"
RUN mkdir indexer
RUN tar -xzC indexer -f indexer.tar.gz


FROM debian:bullseye-slim

RUN set -ex; \
    addgroup --system indexer; \
    adduser --system --ingroup indexer indexer

# Install ca-certificates so HTTPS works in general
RUN apt update && \
  apt install -y --no-install-recommends ca-certificates && \
  rm -rf /var/lib/apt/lists/*

COPY --from=build indexer/rp-indexer /usr/local/bin

USER indexer

ENTRYPOINT []
CMD ["rp-indexer"]
