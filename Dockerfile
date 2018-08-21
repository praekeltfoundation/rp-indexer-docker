FROM scratch

COPY rp-indexer/rp-indexer /usr/local/bin/

EXPOSE 8080

USER rp-indexer

ENTRYPOINT []
CMD ["rp-indexer"]
