VERSION  ?= 1.6
IMAGE    := ghcr.io/magescale/prometheus-varnish-exporter
PLATFORM := linux/amd64
GH_USER  ?= pagottoo

.PHONY: build release login help

help:
	@echo "make build            # build local (--load, sem push)"
	@echo "make release          # build + push (:$(VERSION) + :latest)"
	@echo "make release VERSION=1.7"
	@echo "make login            # docker login ghcr.io via gh token (GH_USER=$(GH_USER))"

build:
	docker buildx build --platform $(PLATFORM) \
		--build-arg EXPORTER_VERSION=$(VERSION) \
		--load \
		-t $(IMAGE):$(VERSION) \
		-t $(IMAGE):latest \
		.

release:
	docker buildx build --platform $(PLATFORM) \
		--build-arg EXPORTER_VERSION=$(VERSION) \
		--push \
		-t $(IMAGE):$(VERSION) \
		-t $(IMAGE):latest \
		.

login:
	gh auth token -u $(GH_USER) | docker login ghcr.io -u $(GH_USER) --password-stdin
