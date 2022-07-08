DOCKER_BUILDER ?= parca-dev/cross-builder

# renovate: datasource=go depName=github.com/goreleaser/goreleaser-cross
GOLANG_CROSS_VERSION := v1.18.3

CMD_DOCKER ?= docker

.PHONY: build
build: $(DOCKER_BUILDER)

.PHONY: $(DOCKER_BUILDER)
$(DOCKER_BUILDER): Dockerfile | $(OUT_DIR)
 	# Build an image on top of goreleaser/goreleaser-cross:${GOLANG_CROSS_VERSION} with the necessary dependencies.
	$(CMD_DOCKER) build -t $(DOCKER_BUILDER):$(GOLANG_CROSS_VERSION) --build-arg=GOLANG_CROSS_VERSION=$(GOLANG_CROSS_VERSION) - < $<
