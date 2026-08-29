ARG EXPORTER_VERSION=1.6

FROM alpine:3.19 AS fetcher
ARG EXPORTER_VERSION
ARG TARGETARCH
RUN wget -qO- "https://github.com/jonnenauha/prometheus_varnish_exporter/releases/download/${EXPORTER_VERSION}/prometheus_varnish_exporter-${EXPORTER_VERSION}.linux-${TARGETARCH}.tar.gz" \
  | tar xz -C /tmp \
  && mv "/tmp/prometheus_varnish_exporter-${EXPORTER_VERSION}.linux-${TARGETARCH}/prometheus_varnish_exporter" /prometheus_varnish_exporter

FROM alpine:3.19
COPY --from=fetcher /prometheus_varnish_exporter /usr/local/bin/prometheus_varnish_exporter
EXPOSE 9131
ENTRYPOINT ["/usr/local/bin/prometheus_varnish_exporter"]
CMD ["-web.listen-address=:9131"]
