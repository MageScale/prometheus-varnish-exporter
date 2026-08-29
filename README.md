# prometheus-varnish-exporter

Imagem MageScale do [jonnenauha/prometheus_varnish_exporter](https://github.com/jonnenauha/prometheus_varnish_exporter) — o upstream só publica binário no GitHub Release, sem imagem Docker oficial.

Publicada em `ghcr.io/magescale/prometheus-varnish-exporter:1.6`. Consumida pelo sidecar Varnish nos tenants Magento (ver `apps/api/internal/task/varnish.go` no repo `magescale`).

Bump: edita `EXPORTER_VERSION` em `Dockerfile` + `.github/workflows/build.yml`, push pra `main` → tag `1.X` + `latest`.
